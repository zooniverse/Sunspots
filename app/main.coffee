require './config/ember'
App.outOfData = true

require './config/zooniverse'
require './config/routes'

require './lib/helpers'
require './routes/all'
require './controllers/all'
require './views/all'
require './templates/all'
require './components/all'

$(document).on 'click', '.menu-handle', -> $(this).closest('nav').toggleClass('open')
$(document).on 'click', 'nav .nav-link', -> $(this).closest('nav').removeClass('open')
