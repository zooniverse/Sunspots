module.exports = App.ClassifyRoute = Ember.Route.extend
  model: ->
    zooniverse.SubjectQueue.fetch()
  
  setupController: (controller, pair) ->
    controller.set 'model', pair
