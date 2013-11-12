Subject = require './subject'

module.exports = Ember.Object.extend
  init: ->
    first = Subject.create @get '0'
    second = Subject.create @get '1'
    
    @set 'subjects', [first, second]
    @set 'first', first
    @set 'second', second
