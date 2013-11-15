{ talkHost } = require '../lib/setup/config'

module.exports = Ember.Object.extend
  init: ->
    @set 'invertedImage', @get('location').inverted
    @set 'talkUrl', "#{ talkHost }/#/subjects/#{ @get 'zooniverse_id' }"
    @set 'socialTitle', 'Zooniverse classification'
    @set 'socialMessage', 'Classifying on the Zooniverse!'
    @preloadImages()
  
  image: (->
    type = if @getWithDefault('isInverted', false) then 'inverted' else 'standard'
    @get('location')[type]
  ).property('isInverted')
  
  standardImage: (->
    @get('location').standard
  ).property()
  
  toggleInverted: ->
    @set 'isInverted', !@getWithDefault('isInverted', false)
  
  preloadImages: ->
    for type, url of @get('location')
      img = new Image
      img.src = url
  
  facebookUrl: ->
    """
      https://www.facebook.com/sharer/sharer.php
      ?s=100
      &p[url]={ encodeURIComponent @get 'talkUrl' }
      &p[title]={ encodeURIComponent @get 'socialTitle' }
      &p[summary]={ encodeURIComponent @get 'socialMessage' }
      &p[images][0]={ @get 'socialMessage' }
    """.replace '\n', '', 'g'
  
  twitterUrl: ->
    status = "{ @get 'socialMessage' } { @get 'talkUrl' }"
    "http://twitter.com/home?status={ encodeURIComponent status }"
  
  pinterestUrl: ->
    """
      http://pinterest.com/pin/create/button/
      ?url={ encodeURIComponent @get 'talkUrl' }
      &media={ encodeURIComponent @get 'image' }
      &description={ encodeURIComponent @get 'socialMessage' }
    """.replace '\n', '', 'g'
