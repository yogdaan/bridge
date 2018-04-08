module.exports = (robot) ->

  robot.hear /(.*)/, (res) ->
  	parse_mode = "Markdown"
  	chat_id = 
  	token = ""
  	reqText = res.envelope.user.name + ' - ' + res.match[0]
  	robot.http("https://api.telegram.org/bot#{token}/sendMessage?parse_mode=#{parse_mode}&chat_id=#{chat_id}&text=" + reqText).get() (err,response,body) ->
  		# no response here since message is going to telegram

	 robot.router.post '/hubot/gitter/:room' , (req, res) -> 
	 	username = req.body.username
	 	console.log req.body
	 	message = req.body.message
	 	room = req.params.room
	 	robot.messageRoom "yogdaan/#{room}", "`#{username}(telegram)` : #{message}"
	 	res.send "200: OKAY"