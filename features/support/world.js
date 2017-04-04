const { defineSupportCode } = require('cucumber')
const mkdirp = require('mkdirp')
const { exec, execFile, spawn } = require('child_process')

const path = require('path')

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
