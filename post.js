$(document).ready(function(){
	$.post('/api/send-email', { "to": "Ian Olsen <iolsen@newrelic.com>", "subject": "hello world", "body": "Hi Ian! Sending you an email via this API I just made." });

});