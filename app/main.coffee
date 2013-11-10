require './lib/setup/zooniverse'
require './lib/setup/video'
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
