AuthenticatedRoute = require './authenticated'
Recent = require '../models/recent'
Favorite = require '../models/favorite'

App.ProfileRecentsRoute = AuthenticatedRoute.extend
  type: 'recents'
  klass: Recent
  per_page: 4
  page: 1
  
  serialize: (model, params) ->
    page: +params.page or @page
  
  url: ->
    "/projects/sunspot/users/#{ zooniverse.models.User.current.id }/#{ @type }"
  
  fetch: (params) ->
    @page = +params.page or 1
    zooniverse.api.get @url(), page: @page, per_page: @per_page
  
  loadRecents: (list) ->
    @klass.create(item) for item in list
  
  model: (params) ->
    @fetch(params).then (list) => @loadRecents(list)
  
  setupController: (controller, model) ->
    controller.set 'model', model

App.ProfileFavoritesRoute = App.ProfileRecentsRoute.extend
  type: 'favorites'
  klass: Favorite

App.ProfileIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'profile.recents', 1

module.exports =
  ProfileRecentsRoute: App.ProfileRecentsRoute
  ProfileFavoritesRoute: App.ProfileFavoritesRoute
  ProfileIndexRoute: App.ProfileIndexRoute
