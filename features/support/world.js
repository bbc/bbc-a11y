const { setWorldConstructor, Before, After } = require('@cucumber/cucumber')
const mkdirp = require('mkdirp')
const { exec, execFile, spawn } = require('child_process')
const path = require('path')
const Runner = require('../../lib/runner')
const NullReporter = require('./nullReporter')
const NullWindowAdapter = require('./nullWindowAdapter')
const { waitForElement, waitForElementWithText } = require('./helpers')

function A11yWorld () {
  this.tempDir = path.resolve(__dirname, '..', '..', 'tmp')
  this.binaryPath = path.resolve(__dirname, '..', '..', 'bin', 'bbc-a11y.js')

  this.runA11y = args => {
    const execArgs = (args?.split(' ')) || []
    return new Promise((resolve, reject) => {
      const result = {}
      const child = execFile(this.binaryPath, execArgs, { cwd: this.tempDir }, (error, stdout, stderr) => {
        if (error) {
          this.error = error
        }
        this.stdout = stdout
        this.stderr = stderr
      })

      child.on('close', code => {
        this.exitCode = code
        resolve(result)
      })
    })
  }

  this.runA11yInteractively = args => {
    return new Promise((resolve, reject) => {
      const splitArgs = args.split(' ').concat('--interactive')
      const interactiveProcess = spawn(this.binaryPath, splitArgs, { cwd: this.tempDir })
      setTimeout(() => { interactiveProcess.kill('SIGINT') }, 2000)
      resolve(interactiveProcess)
    })
  }

  this.runA11yWithManualTests = ({ url, only }) => {
    if (document.getElementById('mainFrame')) {
      document.getElementById('mainFrame').remove()
    }

    if (document.getElementById('answerFrame')) {
      document.getElementById('answerFrame').remove()
    }

    this.mainFrame = document.createElement('iframe')
    this.mainFrame.id = 'mainFrame'
    document.body.appendChild(this.mainFrame)

    this.answerFrame = document.createElement('iframe')
    this.answerFrame.id = 'answerFrame'
    document.body.appendChild(this.answerFrame)

    this.reporter = new NullReporter()
    const windowAdapter = new NullWindowAdapter()
    const exit = () => {}
    this.manualRun = new Runner({
      configPath: './a11y.js',
      runManualTests: true,
      pages: [{ url, only }],
      windowAdapter,
      reporter: this.reporter,
      exit
    }).run()
  }

  this.assertCurrentQuestionIs = async function (question) {
    try {
      const heading = await waitForElement(this.answerFrame, 'h1', { textContent: question, timeout: 3000 }) // Increased timeout slightly
      if (!heading) {
        throw new Error(`Assertion failed: Question heading "${question}" not found.`)
      }
      return true
    } catch (error) {
      const currentContent = this.answerFrame.contentDocument?.body?.innerText || 'unavailable'
      throw new Error(`Failed assertion for question "${question}". Error: ${error.message}. Frame content: ${currentContent}`)
    }
  }

  this.answerQuestion = async function (answer) {
    try {
      // Wait for a button or link with the specified text
      const answerElement = await waitForElementWithText(this.answerFrame, 'button, a', answer, { timeout: 3000 })
      answerElement.click()
    } catch (error) {
      const currentContent = this.answerFrame.contentDocument?.body?.innerText || 'unavailable'
      throw new Error(`Failed to find or click answer "${answer}". Error: ${error.message}. Frame content: ${currentContent}`)
    }
  }

  this.countAllErrors = () => {
    if (!this.manualRun) throw new Error('oops')
    return this.manualRun.then(() => {
      const results = this.reporter.results
      let totalErrors = 0
      for (const url in results) {
        totalErrors += results[url].flatten().errorsFound
      }
      return totalErrors
    })
  }

  this.answerManualTestQuestions = questionsAndAnswers => {
    const answerNextQuestion = async () => {
      if (questionsAndAnswers.length === 0) return Promise.resolve()
      const qa = questionsAndAnswers.shift()
      try {
        await waitForElement(this.answerFrame, 'h1', { textContent: qa.question, timeout: 3000 })

        const answerElement = await waitForElementWithText(this.answerFrame, 'button, a', qa.answer, { timeout: 3000 })
        answerElement.click()
      } catch (e) {
        const currentContent = this.answerFrame.contentDocument?.body?.innerText || 'unavailable'
        throw new Error(`Failed to answer "${qa.question}" with "${qa.answer}". Error: ${e.message}\\nText in answer frame:\\n${currentContent}`)
      }
      await new Promise(resolve => setTimeout(resolve, 100))
      return answerNextQuestion()
    }
    return answerNextQuestion()
  }

  this.answerAllManualTestQuestionsWithOneFail = async () => {
    const answerRestAsPass = async () => {
      try {
        const passButton = await waitForElement(this.answerFrame, '.pass-button', { timeout: 1000 })
        passButton.click()
        await new Promise(resolve => setTimeout(resolve, 50))
        await answerRestAsPass()
      } catch (e) {
        if (!e.message.includes('not found within')) {
          console.error('Unexpected error in answerRestAsPass:', e)
        }
      }
    }

    try {
      const failButton = await waitForElement(this.answerFrame, '.fail-button', { timeout: 3000 })
      failButton.click()
    } catch (error) {
      const currentContent = this.answerFrame.contentDocument?.body?.innerText || 'unavailable'
      throw new Error(`Could not find the initial ".fail-button". Error: ${error.message}. Frame content: ${currentContent}`)
    }

    await new Promise(resolve => setTimeout(resolve, 100))
    await answerRestAsPass()
  }

  this.countErrorsForUrl = url => {
    if (!this.manualRun) throw new Error('oops')
    return this.manualRun.then(() => {
      const pageResult = this.reporter.results[url]
      return pageResult.flatten().errorsFound
    })
  }

  this.countManualTestErrors = () => {
    if (!this.manualRun) throw new Error('oops')
    return this.manualRun.then(() => {
      const results = this.reporter.results
      let manualTestErrors = 0

      for (const resultUrl in results) {
        const pageResult = results[resultUrl]
        if (pageResult?.results) {
          const manualTests = pageResult.results.filter(result =>
            result.standard && result.standard.type === 'manual'
          )

          for (const test of manualTests) {
            manualTestErrors += test.errors.length
          }
        }
      }

      return manualTestErrors
    })
  }

  this.writeFile = (filePath, contents) => {
    const fullPath = path.join(this.tempDir, filePath)
    return new Promise(function (resolve, reject) {
      mkdirp(path.dirname(fullPath), error => {
        if (error) return reject(error)
        require('fs').writeFileSync(fullPath, contents, 'utf-8')
        resolve()
      })
    })
  }
}

setWorldConstructor(A11yWorld)

Before(function (scenario, callback) {
  exec('rm -rf ' + this.tempDir, (err, out) => {
    if (err) return callback(err)
    mkdirp(this.tempDir, callback)
  })
})

After(function (scenario) {
  if (scenario.result.status === 'passed' && this.pageFrame) this.pageFrame.style.display = 'none'
})
