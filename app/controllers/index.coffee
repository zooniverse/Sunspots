module.exports = App.IndexController = Ember.ObjectController.extend
  needs: ['application']
  applicationBinding: 'controllers.application'
  
  project: (->
    @get 'application.model'
  ).property('application.model')
