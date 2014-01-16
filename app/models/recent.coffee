SubjectPair = require './subject_pair'

module.exports = App.Recent = Ember.Object.extend
  type: 'recent'
  
  init: ->
    pair = SubjectPair.create @get('subjects')
    @set 'subjects', pair
    @set 'first', pair.get('first')
    @set 'second', pair.get('second')
    @set 'first.recent_id', @get('id')
    @set 'second.recent_id', @get('id')
