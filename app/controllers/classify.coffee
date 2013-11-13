Classification = zooniverse.models.Classification
SubjectQueue = zooniverse.SubjectQueue

module.exports = Ember.ObjectController.extend
  actions:
    invert: ->
      @set 'invertedToggled', true
      @get('model').toggleInverted()
    
    choose: (subject) ->
      classification = new Classification subjects: @get('model').subjects
      classification.annotate selected_id: subject.id
      classification.annotate inverted: @getWithDefault('invertedToggled', false)
      classification.send()
      SubjectQueue.next().then (pair) =>
        @set 'model', pair
