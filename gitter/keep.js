var http = require("http");
setInterval(function() {
	http.get("http://yogdaanbot.herokuapp.com/keep");
	console.log('keeping alive');
}, 300000); // every 5 minutes (300000)

