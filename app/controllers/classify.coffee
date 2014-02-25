translate = require 't7e'
Classification = zooniverse.models.Classification
SubjectQueue = zooniverse.SubjectQueue

module.exports = App.ClassifyController = Ember.ObjectController.extend
  needs: ['application']
  applicationBinding: 'controllers.application'
  classification: null
  recentPairs: []
  switching: false
  
  project: (->
    @get 'application.model'
  ).property('application.model')
  
  explanationDialog: ->
    dialog = new zooniverse.controllers.Dialog content: $('.explanation-content').html()
    dialog.el.find('.dialog').addClass 'explanation-dialog'
    dialog
  
  actions:
    explain: ->
      zooniverse.GoogleAnalytics.event category: 'navigation', action: 'click', label: 'classify.help', 'true'
      @explanation or= @explanationDialog()
      @explanation.show()
    
    invert: ->
      @set 'invertedToggled', true
      @get('model').toggleInverted()
    
    choose: (subject) ->
      return if @get('switching')
      @set 'switching', true
      
      @get('classification').annotate selected_id: subject.id
      @get('classification').annotate inverted: @getWithDefault('invertedToggled', false)
      @get('classification').send()
      
      user = zooniverse.models.User.current
      user.project.classification_count += 1 if user
      zooniverse.classificationCount += 1
      
      SubjectQueue.next().then (pair) =>
        @set 'model', pair
        @set 'switching', false
        if pair
          @set 'classification', new Classification subjects: @get('model').subjects
        else
          # TO-DO: error reporting
          @transitionTo 'index'
