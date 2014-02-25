App.ScienceIndexRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'science.sunspots'
