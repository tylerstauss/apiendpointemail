require 'sinatra'
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

	def send_mail
			Pony.mail(
						:to => params['to'],
						:from => 'noreply@example.com',
						:subject => params['subject'],
						:body => params['body']
						) 
	end

	send_mail if params['to'] && params['subject'] && params['body']

end

get '/api/send-email' do

end		