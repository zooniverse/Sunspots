module.exports = App.LoginController = Ember.Controller.extend
  init: ->
    zooniverse.models.User.on 'change', => @userDidChange()
  
  userDidChange: ->
    transition = @get 'returnTo'
    if transition
      @set 'returnTo', null
      transition.retry()
    else
      @transitionToRoute 'index'
