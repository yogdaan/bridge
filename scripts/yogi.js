module.exports = function (robot) {

    robot.hear(/((.*\s*)+)/i, function (res) {
        const parse_mode = "Markdown";
        const chat_id = process.env.CHAT_ID;
        const token = process.env.TOKEN;
        const reqText = res.envelope.user.name + ' - ' + res.match[0];
        const url = "https://api.telegram.org/bot";
        return robot.http(`${url}${token}/sendMessage?parse_mode=${parse_mode}&chat_id=${chat_id}&text=` + reqText).get()(function (err, response, body) { });
    });

    // no response here since message is going to telegram

    robot.router.post('/hubot/gitter/:room', function (req, res) {
        const username = req.body.message.from.username || req.body.message.from.first_name;
        const message = req.body.message.text;
        const { room } = req.params;
        robot.messageRoom(`yogdaan/${room}`, `\`${username}(telegram)\` : ${message}`);
        return res.send("200: OKAY");
    });

    return robot.router.get('/keep', (req, res) => res.send("200: Alive"));
};