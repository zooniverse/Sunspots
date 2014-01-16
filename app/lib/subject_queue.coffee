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
    if not @currentFetcher and @queueSize() < @queueMin
      @currentFetcher = @fetcher().then(@loadSubjects).then @setFetchedCurrent
    
    if @queueSize() is 0
      @currentFetcher
    else
      @setCurrent()
      d = deferred()
      d.resolve @current
      d.promise()
  
  @adjustQueueSize: ->
    if zooniverse.classificationCount > 10
      @queueMax = 10
    else if zooniverse.classificationCount > 50
      @queueMax = 20
  
  @loadSubjects: (list) =>
    for pair in list
      @queue.push SubjectPair.create(pair)
  
  @setCurrent: =>
    @current or= @queue.shift()
  
  @fetcher: ->
    @adjustQueueSize()
    zooniverse.api.get '/projects/sunspot/groups/subject_pairs', limit: @toFetch()
  
  @setFetchedCurrent: (result) =>
    @currentFetcher = null
    @current or= @queue.shift()
  
  @toFetch: ->
    Math.max @queueMax - @queueSize(), 0
  
  @queueSize: ->
    size = if @current then @queue.length + 1 else @queue.length

module.exports = SubjectQueue
