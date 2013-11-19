module.exports = App.StatsView = Ember.View.extend
  templateName: 'stats'
  ranked: 34300
  remaining: 190554
  regions: 4
  progress: (->
    Math.round (@get('ranked') / @get('remaining')) * 100
  ).property('ranked', 'remaining')
