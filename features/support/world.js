const { defineSupportCode } = require('cucumber')
const mkdirp = require('mkdirp')
const rimraf = require('rimraf')
const { exec, execFile, spawn } = require('child_process')

const path = require('path')

function A11yWorld() {
  this.tempDir = path.resolve(__dirname + '/../../tmp')

  this.runA11y = args => {
    return new Promise((resolve, reject) => {
      const result = {}
      const binaryPath = path.resolve(__dirname, '../../bin/bbc-a11y.js')
      const child = execFile(binaryPath, (args && [args]) || [], { cwd: this.tempDir }, (error, stdout, stderr) => {
        if (error) {
          result.error = error
        }
        result.stdout = stdout
        result.stderr = stderr
      });

      child.on('close', function (code) {
        result.exitCode = code
        resolve(result)
      })
    });
  }

  this.runA11yInteractively = args => {
    return new Promise((resolve, reject) => {
      const splitArgs = args.split(' ').concat('--interactive')
      const interactiveProcess = spawn(path.resolve(__dirname, '../../bin/bbc-a11y.js'), splitArgs, { cwd: this.tempDir })
      setTimeout(() => { interactiveProcess.kill('SIGINT') }, 2000)
      resolve(interactiveProcess)
    })
  }
}

defineSupportCode(function({ setWorldConstructor, Before, After }) {
  setWorldConstructor(A11yWorld)

  Before(function(scenario, callback) {
    exec('rm -rf ' + this.tempDir, (err, out) => {
      if (err) return callback(err)
      mkdirp(this.tempDir, callback)
    })
  })

  After(function(scenario) {
    if (!scenario.isFailed() && this.pageFrame) this.pageFrame.style.display = 'none'
  })
})
