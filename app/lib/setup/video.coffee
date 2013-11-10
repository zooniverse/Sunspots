detectMobile = require '../detect_mobile'
unless detectMobile()
  $('.sun-video').append """
    <source src="video/sun.ogv" type="video/ogg"></source>
    <source src="video/sun.mp4" type="video/mp4"></source>
    <source src="video/sun.webm" type="video/webm"></source>
  """
