Subject = require './subject'

module.exports = App.SubjectPair = Ember.Object.extend
  init: ->
    @set '0.order', 'first'
    first = Subject.create @get '0'
    @set '1.order', 'second'
    second = Subject.create @get '1'
    
    @set 'subjects', [first, second]
    @set 'first', first
    @set 'second', second
  
  toggleInverted: ->
    @set 'isInverted', !@getWithDefault('isInverted', false)
    @get('first').toggleInverted()
    @get('second').toggleInverted()
