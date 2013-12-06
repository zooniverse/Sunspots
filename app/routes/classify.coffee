Classification = zooniverse.models.Classification

module.exports = App.ClassifyRoute = Ember.Route.extend
  model: ->
    zooniverse.SubjectQueue.fetch()
  
  setupController: (controller, pair) ->
    controller.set 'model', pair
    controller.set 'classification', new Classification subjects: controller.get('model').subjects
