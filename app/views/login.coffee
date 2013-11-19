LoginForm = zooniverse.controllers.LoginForm

module.exports = Ember.View.extend
  afterRenderEvent: ->
    new LoginForm el: @$('.sign-in-form')
