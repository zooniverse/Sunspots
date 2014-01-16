Subject = require './subject'
Recent = require './recent'

module.exports = App.Favorite = Recent.extend
  type: 'favorite'
  
  init: ->
    @set 'subject', Subject.create @get 'subjects.0'
    @set 'subject.favorite_id', @get('id')
