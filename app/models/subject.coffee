{ talkHost } = require '../config/settings'

module.exports = App.Subject = Ember.Object.extend
  init: ->
    @set 'invertedImage', @get('location').inverted
    @set 'talkUrl', "#{ talkHost }/#/subjects/#{ @get 'zooniverse_id' }"
    @set 'socialTitle', 'Zooniverse classification'
    @set 'socialMessage', 'Classifying on Sunspotter!'
    @preloadImages()
  
  image: (->
    type = if @getWithDefault('isInverted', false) then 'inverted' else 'standard'
    @get('location')[type]
  ).property('isInverted')
  
  standardImage: (->
    @get('location').standard
  ).property()
  
  informationData: (->
    date = @get('metadata.date').split('T')[0].replace /\-/g, '/'
    [
      { label: 'Image', value: @get('zooniverse_id') }
      { label: 'Hale', value: @get('metadata.hale') }
      { label: 'Taken At', value: date }
    ]
  ).property('metadata', 'zooniverse_id')
  
  information: (->
    info = []
    for { label, value, unit } in @get('informationData')
      value = zooniverse.util.formatNumber value if typeof value is 'number'
      info.push { label, value, unit }
    info
  ).property('informationData')
  
  isFavorited: (->
    @getWithDefault('favorited', false) or !!@get('favorite_id')
  ).property('favorited', 'favorite_id')
  
  toggleInverted: ->
    @set 'isInverted', !@getWithDefault('isInverted', false)
  
  preloadImages: ->
    for type, url of @get('location')
      img = new Image
      img.src = url
  
  facebookUrl: (->
    """
      https://www.facebook.com/sharer/sharer.php
      ?s=100
      &p[url]=#{ encodeURIComponent @get 'talkUrl' }
      &p[title]=#{ encodeURIComponent @get 'socialTitle' }
      &p[summary]=#{ encodeURIComponent @get 'socialMessage' }
      &p[images][0]=#{ @get 'socialMessage' }
    """.replace '\n', '', 'g'
  ).property('talkUrl', 'socialTitle', 'socialMessage')
  
  twitterUrl: (->
    status = "#{ @get 'socialMessage' } #{ @get 'talkUrl' }"
    "http://twitter.com/home?status=#{ encodeURIComponent status }"
  ).property('socialMessage', 'talkUrl')
  
  pinterestUrl: (->
    """
      http://pinterest.com/pin/create/button/
      ?url=#{ encodeURIComponent @get 'talkUrl' }
      &media=#{ encodeURIComponent @get 'image' }
      &description=#{ encodeURIComponent @get 'socialMessage' }
    """.replace '\n', '', 'g'
  ).property('talkUrl', 'image', 'socialMessage')
