module.exports = Ember.View.extend
  templateName: 'subject'
  classNameBindings: [':subject', 'isFirst:first:second']
  isFirst: (->
    @get('controller.model.order') is 'first'
  ).property('controller.model.order')
