module.exports = App.ApplicationRoute = Ember.Route.extend
  model: ->
    zooniverse.api.get '/projects/sunspot'
  
  setupController: (controller, project) ->
    controller.set 'model', project
    @showProgress project.classification_count
  
  showProgress: (count) ->
    startingAt = 2691352
    goal = 250000
    count = startingAt + 123456 # remove
    count -= startingAt
    percent = Math.min (count / goal), 1
    $('#summer-of-science .current').html zooniverse.util.formatNumber count
    $('#summer-of-science .progress').css 'width', "#{ percent * 100 }%"
  
  activate: ->
    return if App.outOfData
    reloadModel = =>
      zooniverse.api.get('/projects/sunspot').then (project) =>
        @set 'model', project
        @set 'controller.model', project
        @showProgress project.classification_count
        setTimeout reloadModel, 5000
    
    setTimeout reloadModel, 5000
