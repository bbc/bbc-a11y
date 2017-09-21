const { defineSupportCode } = require('cucumber')
const mkdirp = require('mkdirp')
const { exec, execFile, spawn } = require('child_process')
const path = require('path')
const browserMonkey = require('browser-monkey/create')

const Runner = require('../../lib/runner')
const NullReporter = require('./nullReporter')
const NullWindowAdapter = require('./nullWindowAdapter')

function A11yWorld () {
  this.tempDir = path.resolve(__dirname, '..', '..', 'tmp')
  this.binaryPath = path.resolve(__dirname, '..', '..', 'bin', 'bbc-a11y.js')

  this.runA11y = args => {
    const execArgs = (args && args.split(' ')) || []
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

  this.runA11yWithManualTests = ({ url }) => {
    if (document.getElementById('mainFrame')) {
      document.getElementById('mainFrame').remove()
    }

    if (document.getElementById('answerFrame')) {
      document.getElementById('answerFrame').remove()
    }

    this.mainFrame = document.createElement('iframe')
    this.mainFrame.id = 'mainFrame'
    document.body.appendChild(this.mainFrame)
    this.mainFrameMonkey = browserMonkey(this.mainFrame)

    this.answerFrame = document.createElement('iframe')
    this.answerFrame.id = 'answerFrame'
    document.body.appendChild(this.answerFrame)
    this.answerFrameMonkey = browserMonkey(this.answerFrame)

    this.reporter = new NullReporter()
    const windowAdapter = new NullWindowAdapter()
    const exit = () => {}
    this.manualRun = new Runner('./a11y.js', true).run([{ url }], windowAdapter, this.reporter, exit)
  }

  this.answerManualTestQuestions = questionsAndAnswers => {
    const answerNextQuestion = () => {
      if (questionsAndAnswers.length === 0) return Promise.resolve()
      const qa = questionsAndAnswers.shift()
      return this.answerFrameMonkey.find('h1', { text: qa.question }).shouldExist()
        .then(() => this.answerFrameMonkey.click(qa.answer))
        .then(() => answerNextQuestion())
    }
    return answerNextQuestion()
  }

  this.countErrorsForUrl = url => {
    if (!this.manualRun) throw new Error('oops')
    return this.manualRun.then(() => {
      const pageResult = this.reporter.results[url]
      return pageResult.flatten().errorsFound
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

defineSupportCode(function ({ setWorldConstructor, Before, After }) {
  setWorldConstructor(A11yWorld)

  Before(function (scenario, callback) {
    exec('rm -rf ' + this.tempDir, (err, out) => {
      if (err) return callback(err)
      mkdirp(this.tempDir, callback)
    })
  })

  After(function (scenario) {
    if (!scenario.isFailed() && this.pageFrame) this.pageFrame.style.display = 'none'
  })
})
