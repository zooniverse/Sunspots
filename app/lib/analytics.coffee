class GoogleAnalytics
  constructor: (params = {}) ->
    $(window).on 'hashchange', ->
      window.ga 'send', 'pageview', "/#{ window.location.hash }"
  
  event: (opts = { }) ->
    window.ga 'send', 'event', opts.category, opts.action, opts.label, opts.value

module.exports = GoogleAnalytics
