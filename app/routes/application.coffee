module.exports = App.ApplicationRoute = Ember.Route.extend
  model: ->
    zooniverse.api.get '/projects/sunspot'
  
  setupController: (controller, project) ->
    controller.set 'model', project
  
  activate: ->
    return if App.outOfData
    reloadModel = =>
      zooniverse.api.get('/projects/sunspot').then (project) =>
        @set 'model', project
        @set 'controller.model', project
        setTimeout reloadModel, 5000
    
    setTimeout reloadModel, 5000
