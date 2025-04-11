module.exports = {
  set: ({ url, cookies }) => {
    const electronRemote = require('electron').remote
    const session = electronRemote.session.defaultSession

    if (!cookies || !cookies.length) {
      return Promise.resolve()
    }

    return Promise.all((cookies || []).map((cookie) => new Promise((resolve, reject) => {
      try {
        const cookieValue = Object.assign({}, cookie, { url })
        console.log('Setting cookie:', cookieValue)

        session.cookies.set(cookieValue)
          .then(() => {
            console.log('Cookie set successfully:', cookie.name)
            resolve()
          })
          .catch(err => {
            console.error('Error setting cookie:', err)
            resolve()
          })
      } catch (e) {
        console.error('Exception in cookie handling:', e)
        resolve()
      }
    })))
  }
}
