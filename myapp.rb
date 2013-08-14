require 'sinatra'

get '/' do
  	erb :index
end


post '/sendmail' do
	require 'pony'
 	Pony.mail({
	:from => params["contact_email"],
    :to => 'aviandri@gmail.com',
    :subject => params["contact_email"] + " " +  params["contact_name"],
    :body => params["contact_message"],
    :via => :smtp,
    :via_options => {
     :address              => 'smtp.gmail.com',
     :port                 => '587',
     :enable_starttls_auto => true,
     :user_name            => '',
     :password             => '',
     :authentication       => :plain, 
     :domain               => "" 
     }
    })
end