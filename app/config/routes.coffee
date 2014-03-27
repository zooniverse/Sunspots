App.Router.map ->
  @route 'login'
  @route 'done'
  @resource 'classify'
  @resource 'science', ->
    @route 'sunspots'
    @route 'complexity'
    @route 'why'
    @route 'goals'
    @route 'data'
  @resource 'education'
  @resource 'team'
  @resource 'discuss'
  @resource 'blog'
  @resource 'profile', ->
    @route 'recents', path: '/recents/:page'
    @route 'favorites', path: '/favorites/:page'
