module.exports = App.TeamMemberComponent = Ember.Component.extend
  tagName: 'div'
  classNames: ['person']
  avatar: (->
    "images/avatars/#{ @get('name').split(' ').pop().toLowerCase().replace(' ', '_') }.png"
  ).property('name')
