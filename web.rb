require 'sinatra'
require 'json'
require 'uri'
require 'httparty'
require 'pony'

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => 'app26028351@heroku.com',
    :password => 'ehwyfdfq',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

get '/' do
	"Hello World"
	# HTTParty.post('/api/send-email', 
 #    :body => { :to => 'tyler.e.stauss@gmail.com', 
 #               :subject => 'Hello World', 
 #               :body => 'Hi Ian! Sending you an email via this API I just made.'
 #             }.to_json,
 #    :headers => { 'Content-Type' => 'application/json' } )
end

get '/api/send-email' do
	# @response = JSON.parse(request.body.to_s)
	# p @response
	'api send-email'
	puts 'email not sent'
	Pony.mail(
						:to => 'tyler.e.stauss@gmail.com',
						:from => 'tyler.e.stauss@gmail.com',
						:subject => 'hello world',
						:body => 'Hi Ian! Sending you an email via this API I just made.'
						) 
	puts 'email sent'
end