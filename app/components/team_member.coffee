module.exports = Ember.Component.extend
  tagName: 'div'
  classNames: ['person']
  avatar: (->
    "images/avatars/#{ @get('name').toLowerCase().replace(' ', '_') }.png"
  ).property('name')
