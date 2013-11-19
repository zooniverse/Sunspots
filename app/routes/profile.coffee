AuthenticatedRoute = require './authenticated'
Recent = require '../models/recent'
Favorite = require '../models/favorite'

App.ProfileRecentsRoute = AuthenticatedRoute.extend
  type: -> 'recents'
  klass: -> Recent
  
  url: ->
    "/projects/solar/users/#{ zooniverse.models.User.current.id }/#{ @type() }"
  
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
  klass: -> Favorite

App.ProfileIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'profile.recents', 1

module.exports =
  ProfileRecentsRoute: App.ProfileRecentsRoute
  ProfileFavoritesRoute: App.ProfileFavoritesRoute
  ProfileIndexRoute: App.ProfileIndexRoute
