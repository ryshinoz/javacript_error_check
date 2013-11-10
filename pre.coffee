fs = require('fs')
cookies_file = fs.workingDirectory + fs.separator + 'cookies.txt'
settings_file = fs.workingDirectory + fs.separator + 'settings.json'

casper.loadCookies = ->
  if fs.exists cookies_file
    return JSON.parse fs.read cookies_file

casper.saveCookies = (cookies) ->
  cookies_string = JSON.stringify cookies
  fs.write cookies_file, cookies_string, 644

casper.loadSettings = ->
  if fs.exists settings_file
    return JSON.parse fs.read settings_file

casper.test.done()
