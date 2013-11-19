Ember.Handlebars.helper 'formatNumber', (number) ->
  new Handlebars.SafeString window.zooniverse.util.formatNumber(number)

Ember.Handlebars.helper 'translate', (key) ->
  new Handlebars.SafeString window.zooniverse.translate(key)
