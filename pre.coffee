fs = require('fs')

cookies_file = casper.cli.get 'cookies_file'

casper.loadCookies = ->
  if fs.exists cookies_file
    return JSON.parse fs.read cookies_file

casper.saveCookies = (cookies) ->
  cookies_string = JSON.stringify cookies
  fs.write cookies_file, cookies_string, 644

settings_file = casper.cli.get 'settings_file'

casper.loadSettings = ->
  if fs.exists settings_file
    return JSON.parse fs.read settings_file

capture_path = casper.cli.get 'capture_dir'

casper.loadCapturePath = (result) ->
  filename = result['file'].substr(result['file'].lastIndexOf('/') + 1)
  return capture_path + fs.separator + filename + '.png'

casper.test.done()
