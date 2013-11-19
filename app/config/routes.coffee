App.Router.map ->
  @route 'login'
  @resource 'classify'
  @resource 'science'
  @resource 'education'
  @resource 'team'
  @resource 'discuss'
  @resource 'blog'
  @resource 'profile', ->
    @route 'recents', path: '/recents/:page'
    @route 'favorites', path: '/favorites/:page'