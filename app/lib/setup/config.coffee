Config =
  developmentLocal:
    apiHost: 'http://localhost:3000'
    classifyUrl: 'http://localhost:9295/#/classify'
    analytics: { }
  
  developmentRemote:
    apiHost: 'https://dev.zooniverse.org'
    classifyUrl: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots/#/classify'
    analytics: { }
  
  production:
    apiHost: 'https://api.zooniverse.org'
    classifyUrl: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots/#/classify'
    analytics: { }

env = if window.location.port is '9295'
  'developmentLocal'
else if window.location.port > 1024
  'developmentRemote'
else
  'production'

module.exports = Config[env]
