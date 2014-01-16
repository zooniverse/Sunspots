module.exports = App.ApplicationRoute = Ember.Route.extend
  model: ->
    zooniverse.api.get '/projects/sunspot'
  
  setupController: (controller, project) ->
    controller.set 'model', project
