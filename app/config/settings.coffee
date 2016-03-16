Settings =
  developmentLocal:
    apiHost: 'http://localhost:3000'
    talkHost: 'http://localhost:9296'
    analytics: { }

  developmentRemote:
    apiHost: 'https://dev.zooniverse.org'
    talkHost: 'http://zooniverse-demo.s3-website-us-east-1.amazonaws.com/sunspots_talk'
    analytics: { }

  production:
    apiHost: 'https://www.sunspotter.org'
    apiPath: '/_ouroboros_api/proxy'
    talkHost: 'https://talk.sunspotter.org'
    analytics: { }

env = if window.location.port is '9295'
  'developmentLocal'
else if window.location.port > 1024
  'developmentRemote'
else
  'production'

module.exports = Settings[env]
