require 'sinatra'
require 'json'
require 'uri'
require 'httparty'

get '/' do
	"Hello World"
	@result = HTTParty.post('/api/send-email', 
    :body => { :subject => 'This is the screen name', 
               :issue_type => 'Application Problem', 
               :status => 'Open', 
               :priority => 'Normal', 
               :description => 'This is the description for the problem'
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
end

post '/api/send-email' do
	{ "to": "Ian Olsen <iolsen@newrelic.com>", "subject": "hello world", "body": "Hi Ian! Sending you an email via this API I just made." }
end