fs = require('fs')
cookies_file = fs.workingDirectory + fs.separator + 'cookies.txt'

casper.loadCookies = ->
  if fs.exists cookies_file
    return JSON.parse fs.read cookies_file

casper.saveCookies = (cookies) ->
  cookies_string = JSON.stringify cookies
  fs.write cookies_file, cookies_string, 644

casper.test.done()
