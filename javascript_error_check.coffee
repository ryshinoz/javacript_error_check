casper = require('casper').create
  logLevel: 'debug'

if casper.cli.args.length isnt 3
  casper.echo('Usage: capsperjs javascript_error_check.coffee "url" "useragent" "cookies_file"').exit(1)

url          = casper.cli.get 0
useragent    = casper.cli.get 1
cookies_file = casper.cli.get 2

casper.userAgent useragent

fs = require 'fs'
if fs.exists cookies_file
  data = fs.read cookies_file
  phantom.cookies = JSON.parse data

errors = []

casper.start url

casper.on 'page.error', (msg, trace) ->
  @echo 'Error:    ' + msg, 'ERROR'
  @echo 'file:     ' + trace[0].file, 'WARNING'
  @echo 'line:     ' + trace[0].line, 'WARNING'
  @echo 'function: ' + trace[0]['function'], 'WARNING'
  errors.push(msg)

casper.run ->
  cookies = JSON.stringify phantom.cookies
  fs.write cookies_file, cookies, 644
  if errors.length > 0
    @echo errors.length + ' JavaScript errors found', 'ERROR'
    @exit(1)
  else
    @echo 'JavaScript errors not found', 'INFO'
    @exit(0)
