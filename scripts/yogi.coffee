module.exports = (robot) ->

  robot.hear /(.*)/, (res) ->
    res.send res.envelope.user.name + ' : ' + res.match[0]
