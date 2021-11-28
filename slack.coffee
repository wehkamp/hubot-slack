SlackBot = require './src/bot'
require './src/extensions'

exports.use = (robot) ->

  options =
    token:           process.env.HUBOT_SLACK_TOKEN
    disableUserSync: process.env.DISABLE_USER_SYNC?
    apiPageSize:     process.env.API_PAGE_SIZE
    
    # reacts to only messages by insalled workspace users in a shared channel
    installedTeamOnly: process.env.INSTALLED_TEAM_ONLY?
  try
    options.rtm = JSON.parse(process.env.HUBOT_SLACK_RTM_CLIENT_OPTS)
  catch
  try
    options.rtmStart = JSON.parse(process.env.HUBOT_SLACK_RTM_START_OPTS)
  catch

  options.app = {}
  options.app.token = process.env.HUBOT_SLACK_TOKEN
  options.app.appToken = process.env.HUBOT_SLACK_TOKEN
  console.log options

  new SlackBot robot, options
