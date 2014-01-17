translate = require 't7e'

Ember.Handlebars.helper 'formatNumber', (number) ->
  new Handlebars.SafeString window.zooniverse.util.formatNumber(number)

Ember.Handlebars.registerHelper 'translate', (args..., emberOptions) ->
  new Handlebars.SafeString translate args...

Ember.Handlebars.helper 'paginate', (data) ->
  linkTo = (page, opts = { }) ->
    opts.klass or= if page is data.page then 'current' else ''
    href = if page > 0 and page <= data.pages
      "#/profile/#{ data.type }/#{ page }"
    else
      opts.klass += ' disabled'
      ''
    
    """<a class="#{ opts.klass }" href="#{ href }">#{ opts.text or page }</a>"""
  
  pages = translate 'profile.pages'
  pages = pages.replace /\{\s?x\s?\}/i, linkTo data.page
  pages = pages.replace /\{\s?y\s?\}/i, linkTo data.pages
  previousPage = linkTo data.page - 1, text: translate('profile.previous'), klass: 'previous'
  nextPage = linkTo data.page + 1, text: translate('profile.next'), klass: 'next'
  
  new Handlebars.SafeString """
    <div class="pages">
      #{ previousPage } #{ pages } #{ nextPage }
    </div>
  """
, 'type', 'page', 'pages', 'entries'
