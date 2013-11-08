User = require 'zooniverse/models/user'
Api = require 'zooniverse/lib/api'
TopBar = require 'zooniverse/controllers/top-bar'
Footer = require 'zooniverse/controllers/footer'

zooniverse.api = new Api project: 'solar', host: 'http://localhost:3000'
zooniverse.topBar = new TopBar
zooniverse.topBar.el.appendTo $('header')
zooniverse.footer = new Footer
zooniverse.footer.el.appendTo $('footer')

App = Ember.Application.create rootElement: '#app', LOG_TRANSITIONS: true, LOG_TRANSITIONS_INTERNAL: true

require './templates/application'
require './templates/index'
require './templates/classify'
require './templates/science'
require './templates/education'
require './templates/team'
require './templates/discuss'
require './templates/blog'
require './templates/profile'

App.Router.map ->
  @resource 'classify'
  @resource 'science'
  @resource 'education'
  @resource 'team'
  @resource 'discuss'
  @resource 'blog'
  @resource 'profile'
