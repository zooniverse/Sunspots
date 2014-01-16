Classification = zooniverse.models.Classification

module.exports = App.ClassifyRoute = Ember.Route.extend
  model: ->
    zooniverse.SubjectQueue.fetch()
  
  setupController: (controller, pair) ->
    controller.set 'model', pair
    if pair
      controller.set 'classification', new Classification subjects: controller.get('model').subjects
    else
      # TO-DO: report errors
      @transitionTo 'index'
