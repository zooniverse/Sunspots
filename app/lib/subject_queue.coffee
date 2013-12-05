SubjectPair = require '../models/subject_pair'
deferred = $.Deferred

class SubjectQueue
  @queueMax: 5
  @queueMin: 2
  @queue: []
  @current: null
  @currentFetcher = null
  
  @next: =>
    @current = null
    @fetch().then =>
      @setCurrent() unless @current
      @current
  
  @fetch: ->
    return @currentFetcher if @currentFetcher
    if @queueSize() < @queueMin
      @currentFetcher = @fetcher().then(@loadSubjects).then @setCurrent
    else
      d = deferred()
      d.resolve @current
      d.promise()
  
  @loadSubjects: (list) =>
    for pair in list
      @queue.push SubjectPair.create(pair)
  
  @setCurrent: =>
    @currentFetcher = null
    @current = @queue.shift()
  
  @fetcher: ->
    zooniverse.api.get '/projects/sunspot/groups/random/subjects', comparison: 'complexity', limit: @toFetch()
  
  @toFetch: ->
    Math.max @queueMax - @queueSize(), 0
  
  @queueSize: ->
    size = if @current then @queue.length + 1 else @queue.length

module.exports = SubjectQueue
