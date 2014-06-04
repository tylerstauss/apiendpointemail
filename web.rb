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
	"Hello World"

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