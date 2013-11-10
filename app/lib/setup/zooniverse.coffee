Config = require './config'
User = require 'zooniverse/models/user'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
Footer = require 'zooniverse/controllers/footer'

zooniverse.api = new Api project: 'solar', host: Config.apiHost
zooniverse.topBar = new TopBar
zooniverse.topBar.el.appendTo $('header')
zooniverse.footer = new Footer
zooniverse.footer.el.appendTo $('footer')
