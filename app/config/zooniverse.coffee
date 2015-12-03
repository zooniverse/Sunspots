translate = require 't7e'
enUs = require '../lib/en-us'

translate.load enUs

Settings = require './settings'
User = require 'zooniverse/models/user'
Classification = require 'zooniverse/models/classification'
Api = require 'zooniverse/lib/api'
LanguageManager = require 'zooniverse/lib/language-manager'
TopBar = require 'zooniverse/controllers/top-bar'
Footer = require 'zooniverse/controllers/footer'

zooniverse.api = new Api project: 'sunspot', host: Settings.apiHost, path: Settings.apiPath

languageManager = new LanguageManager
  translations:
    en: label: 'English', strings: enUs
    zh_tw: label: '繁體中文', strings: './translations/zh-tw.json'
    es: label: 'Español', strings: './translations/es.json'
    de: label: 'Deutsch', strings: './translations/de.json'
    pl: label: 'Polski', strings: './translations/pl.json'

languageManager.on 'change-language', (e, code, strings) ->
  translate.load strings
  translate.refresh()

zooniverse.topBar = new TopBar
zooniverse.topBar.el.appendTo $('#header')
zooniverse.footer = new Footer
zooniverse.footer.el.appendTo $('#footer')

browserDialog = require 'zooniverse/controllers/browser-dialog'
browserDialog.check msie: 9

zooniverse.util = $.extend zooniverse.util, require '../lib/util'
zooniverse.SubjectQueue = require '../lib/subject_queue'
User.fetch()
zooniverse.SubjectQueue.fetch() unless App.outOfData
zooniverse.classificationCount = 0
GoogleAnalytics = require '../lib/analytics'
window.zooniverse.GoogleAnalytics = new GoogleAnalytics
