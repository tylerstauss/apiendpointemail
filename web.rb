require 'sinatra'
require 'json'
require 'uri'
require 'httparty'
require 'pony'
require 'dotenv'

Dotenv.load

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

get '/' do
	"Hello Ian"
	erb :index
end

post '/api/send-email' do
	# @response = JSON.parse(request.body.to_s)
	# p '*' * 50
	# p params['to']
	# p JSON.parse(params.to_s)
	# p '*' * 50
	# p @response
	Pony.mail(
						:to => params['to'],
						:from => 'tyler.e.stauss@gmail.com',
						:subject => params['subject'],
						:body => params['body']
						) 
end