module.exports = App.LoginView = Ember.View.extend
  afterRenderEvent: ->
    new zooniverse.controllers.LoginForm el: @$('.sign-in-form')
