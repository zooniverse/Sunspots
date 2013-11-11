require './lib/setup/zooniverse'
require './lib/setup/video'
window.App = Ember.Application.create
  rootElement: '#app'
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true

Ember.Handlebars.helper 'formatNumber', (number) ->
  new Handlebars.SafeString zooniverse.util.formatNumber(number)

require './templates/application'
require './templates/index'
require './templates/classify'
require './templates/science'
require './templates/education'
require './templates/team'
require './templates/discuss'
require './templates/blog'
require './templates/profile'

App.TeamMemberComponent = require './components/team_member'
require './components/team-member'

App.StatsView = require './views/stats'
require './templates/stats'

App.Router.map ->
  @resource 'classify'
  @resource 'science'
  @resource 'education'
  @resource 'team'
  @resource 'discuss'
  @resource 'blog'
  @resource 'profile'
