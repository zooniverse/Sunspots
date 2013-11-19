require './lib/setup/zooniverse'
require './lib/setup/video'
User = zooniverse.models.User

window.App = Ember.Application.create
  rootElement: '#app'
  LOG_TRANSITIONS: true

Ember.Handlebars.helper 'formatNumber', (number) ->
  new Handlebars.SafeString zooniverse.util.formatNumber(number)

Ember.Handlebars.helper 'translate', (key) ->
  new Handlebars.SafeString window.zooniverse.translate(key)

Ember.View.reopen
  didInsertElement: ->
    @_super()
    Ember.run.scheduleOnce 'afterRender', @, @afterRenderEvent
  
  afterRenderEvent: $.noop

require './templates/application'
require './templates/index'
require './templates/classify'
require './templates/science'
require './templates/education'
require './templates/team'
require './templates/discuss'
require './templates/blog'
require './templates/profile'
require './templates/profile/recents'
require './templates/profile/favorites'

App.TeamMemberComponent = require './components/team_member'
require './components/team-member'

App.StatsView = require './views/stats'
require './templates/stats'

App.LoginView = require './views/login'
require './templates/login'

App.SubjectView = require './views/subject'
App.RecentSubjectView = require './views/recent_subject'
require './templates/subject'
require './templates/recent_subject'

App.Router.map ->
  @route 'login'
  @resource 'classify'
  @resource 'science'
  @resource 'education'
  @resource 'team'
  @resource 'discuss'
  @resource 'blog'
  @resource 'profile', ->
    @route 'recents', path: '/recents/:page'
    @route 'favorites', path: '/favorites/:page'

App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @redirectToLogin(transition) unless User.current
  
  redirectToLogin: (transition) ->
    @controllerFor('login').set 'returnTo', transition
    @transitionTo 'login'

App.LoginController = Ember.Controller.extend
  init: ->
    User.on 'change', => @userDidChange()
  
  userDidChange: ->
    transition = @get 'returnTo'
    if transition
      @set 'returnTo', null
      transition.retry()
    else
      @transitionToRoute 'index'

App.ClassifyController = require './controllers/classify'

App.ClassifyRoute = Ember.Route.extend
  model: ->
    zooniverse.SubjectQueue.fetch()
  
  setupController: (controller, pair) ->
    controller.set 'model', pair

App.Recent = require './models/recent'
App.Favorite = require './models/favorite'

App.ProfileRecentsRoute = App.AuthenticatedRoute.extend
  type: -> 'recents'
  klass: -> App.Recent
  
  url: ->
    "/projects/solar/users/#{ User.current.id }/#{ @type() }"
  
  fetch: (params) ->
    zooniverse.api.get @url(), page: +params.page
  
  loadRecents: (list) ->
    @klass().create(item) for item in list
  
  model: (params) ->
    @fetch(params).then (list) => @loadRecents(list)
  
  setupController: (controller, model) ->
    controller.set 'model', model

App.ProfileFavoritesRoute = App.ProfileRecentsRoute.extend
  type: -> 'favorites'
  klass: -> App.Favorite

App.ProfileIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'profile.recents', 1
