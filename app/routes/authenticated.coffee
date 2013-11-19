module.exports = App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    @redirectToLogin(transition) unless zooniverse.models.User.current
  
  redirectToLogin: (transition) ->
    @controllerFor('login').set 'returnTo', transition
    @transitionTo 'login'
