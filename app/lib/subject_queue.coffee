SubjectPair = require '../models/subject_pair'
deferred = $.Deferred

class SubjectQueue
  @queueMax: 5
  @queueMin: 2
  @queue: []
  @current: null
  
  @next: =>
    @current = null
    @fetch().then =>
      @setCurrent() unless @current
      @current
  
  @fetch: ->
    if @queueSize() < @queueMin
      @fetcher().then(@loadSubjects).then @setCurrent
    else
      d = deferred()
      d.resolve @current
      d.promise()
  
  @loadSubjects: (list) =>
    for pair in list
      @queue.push SubjectPair.create(pair)
  
  @setCurrent: =>
    @current = @queue.shift()
  
  @fetcher: ->
    zooniverse.api.get '/projects/solar/subjects', comparison: 'complexity', limit: @toFetch()
  
  @toFetch: ->
    Math.max @queueMax - @queueSize(), 0
  
  @queueSize: ->
    size = if @current then @queue.length + 1 else @queue.length

module.exports = SubjectQueue
