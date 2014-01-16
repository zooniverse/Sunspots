module.exports = App.StatsView = Ember.View.extend
  templateName: 'stats'
  
  project: (->
    @get('controller.project')
  ).property('controller.project')
  
  rankings: (->
    @getWithDefault 'project.classification_count', 0
  ).property('project.classification_count')
  
  users: (->
    @getWithDefault 'project.classifier_count', 0
  ).property('project.classifier_count')
  
  total: (->
    @getWithDefault 'project.subject_count', 0
  ).property('project.subject_count')
  
  pass: (->
    @getWithDefault 'project.pass', 0
  ).property('project.pass')
