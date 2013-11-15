phantom.cookies = casper.loadCookies()

setting = casper.loadSettings()
casper.userAgent setting.userAgent

casper.echo setting.userAgent

casper.test.on 'fail', (result) ->
  casper.saveCookies phantom.cookies
  casper.capture casper.loadCapturePath result

casper.test.begin 'Google search retrieves', (test) ->
  casper.start 'http://prcm.jp', ->
    test.assertTitle '画像★検索プリ画像 - プリキャン革命!'

  casper.run ->
    casper.saveCookies phantom.cookies
    test.done()
