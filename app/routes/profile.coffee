AuthenticatedRoute = require './authenticated'
Recent = require '../models/recent'
Favorite = require '../models/favorite'

App.ProfileRecentsRoute = AuthenticatedRoute.extend
  type: 'recents'
  klass: Recent
  perPage: 4
  entriesPerPage: 8
  page: 1
  
  serialize: (model, params) ->
    page: +params.page or @page
  
  url: ->
    "/projects/sunspot/users/#{ zooniverse.models.User.current.id }/#{ @type }"
  
  fetch: (params) ->
    @page = +params.page or 1
    zooniverse.api.get @url(), page: @page, per_page: @perPage
  
  loadRecents: (list) ->
    @klass.create(item) for item in list
  
  totalEntries: ->
    2 * zooniverse.models.User.current.project.classification_count
  
  model: (params) ->
    @fetch(params).then (list) =>
      data = @loadRecents list
      data.type = @type
      data.page = @page
      data.entries = @totalEntries()
      data.pages = Math.ceil data.entries / @entriesPerPage
      data
  
  setupController: (controller, model) ->
    controller.set 'model', model

App.ProfileFavoritesRoute = App.ProfileRecentsRoute.extend
  type: 'favorites'
  klass: Favorite
  perPage: 8
  
  totalEntries: ->
    zooniverse.models.User.current.project.favorite_count

App.ProfileIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'profile.recents', 1

module.exports =
  ProfileRecentsRoute: App.ProfileRecentsRoute
  ProfileFavoritesRoute: App.ProfileFavoritesRoute
  ProfileIndexRoute: App.ProfileIndexRoute
