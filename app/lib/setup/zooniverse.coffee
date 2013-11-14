Config = require './config'
User = require 'zooniverse/models/user'
Classification = require 'zooniverse/models/classification'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
Footer = require 'zooniverse/controllers/footer'

zooniverse.api = new Api project: 'solar', host: Config.apiHost
zooniverse.topBar = new TopBar
zooniverse.topBar.el.appendTo $('#header')
zooniverse.footer = new Footer
zooniverse.footer.el.appendTo $('#footer')
zooniverse.util = $.extend zooniverse.util, require '../util'
zooniverse.SubjectQueue = require '../subject_queue'
User.fetch()
zooniverse.SubjectQueue.fetch()
