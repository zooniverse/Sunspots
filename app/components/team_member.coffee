module.exports = App.TeamMemberComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['person']
  avatar: (->
    fileName = @get('name').toLowerCase().replace(/\./g, '').replace /\s+/g, '_'
    "images/avatars/#{ fileName }.png"
  ).property('name')
