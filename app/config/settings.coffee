Settings =
  developmentLocal:
    apiHost: 'http://localhost:3000'
    classifyUrl: 'http://localhost:9295/#/classify'
    talkHost: 'http://localhost:9296'
    analytics: { }
  
  developmentRemote:
    apiHost: 'https://dev.zooniverse.org'
    classifyUrl: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots/#/classify'
    talkHost: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots_talk'
    analytics: { }
  
  production:
    apiHost: 'https://dev.zooniverse.org'
    classifyUrl: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots/#/classify'
    talkHost: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots_talk'
    analytics: { }

env = if window.location.port is '9295'
  'developmentLocal'
else if window.location.port > 1024
  'developmentRemote'
else
  'production'

module.exports = Settings[env]
