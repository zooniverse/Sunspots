Classification = zooniverse.models.Classification
SubjectQueue = zooniverse.SubjectQueue

module.exports = App.ClassifyController = Ember.ObjectController.extend
  classification: null
  recentPairs: []
  switching: false
  
  recent: (->
    @get 'recentPairs'
  ).property('recentPairs')
  
  addRecent: (pair) ->
    pairs = @get 'recentPairs'
    pairs.pushObject @get('model')
    pairs.shiftObject() while pairs.length > 6
  
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
        @addRecent()

        @set 'model', pair
        @set 'switching', false
        @set 'classification', new Classification subjects: @get('model').subjects
