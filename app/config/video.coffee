detectMobile = require '../lib/detect_mobile'

video = $('.sun-video')
poster = $('.sun-poster')

# TO-DO: reduce file size for performance, use playbackRate to reduce speed
# 
# unless detectMobile()
#   video.append """
#     <source src="video/sun.ogv" type="video/ogg"></source>
#     <source src="video/sun.mp4" type="video/mp4"></source>
#     <source src="video/sun.webm" type="video/webm"></source>
#   """
#   video[0].playbackRate = 0.5

video.on 'play', ->
  video.css display: 'block'
  poster.css display: 'none'
