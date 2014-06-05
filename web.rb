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
	Pony.mail(
						:to => params['to'],
						:from => 'tyler.e.stauss@gmail.com',
						:subject => params['subject'],
						:body => params['body']
						) 
end

get '/api/send-email' do

end		