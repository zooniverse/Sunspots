class GoogleAnalytics
  constructor: (params = {}) ->
    $(window).on 'hashchange', ->
      window.ga 'send', 'pageview', "/#{ window.location.hash }"
  
  event: (category, action, label, value, ignoreForBounceRate) ->
    window.ga 'send', 'event', 'category', 'action', page: pathname

module.exports = GoogleAnalytics
