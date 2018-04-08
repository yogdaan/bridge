module.exports = (robot) ->

  robot.hear /(.*)/, (res) ->
  	reqText = res.envelope.user.name + ' - ' + res.match[0]
  	robot.http("https://api.telegram.org/bot:{token}/sendMessage?parse_mode={parse_mode}&chat_id={chat_id}&text=" + reqText).get() (err,response,body) ->