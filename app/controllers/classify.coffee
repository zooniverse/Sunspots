Classification = zooniverse.models.Classification
SubjectQueue = zooniverse.SubjectQueue

module.exports = App.ClassifyController = Ember.ObjectController.extend
  needs: ['application']
  applicationBinding: 'controllers.application'
  classification: null
  recentPairs: []
  switching: false
  
  project: (->
    @get('application.model')
  ).property('')
  
  actions:
    invert: ->
      @set 'invertedToggled', true
      @get('model').toggleInverted()
    
    choose: (subject) ->
      return if @get('switching')
      @set 'switching', true
      
      @get('classification').annotate selected_id: subject.id
      @get('classification').annotate inverted: @getWithDefault('invertedToggled', false)
      @get('classification').send()
      
      SubjectQueue.next().then (pair) =>
        @set 'model', pair
        @set 'switching', false
        if pair
          @set 'classification', new Classification subjects: @get('model').subjects
        else
          # TO-DO: error reporting
          @transitionTo 'index'
