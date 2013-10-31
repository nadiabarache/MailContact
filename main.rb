require "rubygems"
require "sinatra"
require 'pony'
require "pry"

require 'mail'




get '/' do 
 erb :index
end

  
post '/' do 
    
    Pony.mail(
      :from => params[:name] + "<" + params[:email] + ">",
      :to => 'barache.nadia@yahoo.fr',
      :subject => "Vous avez un message de " + params[:name],
      :body => params[:message],
      :port => '587',
      :via => :smtp,
      :via_options => { 
        :address              => 'smtp.gmail.com', 
        :port                 => '25', 
        :enable_starttls_auto => true, 
        :user_name            => 'barache.nadia@gmail.com', 
        :password             => 'saddeknadia20052013', 
        :authentication       => :plain, 
        :domain               => 'localhost.localdomain'
      })
    redirect '/' 
end
 
get '/success'  do 
	erb :success
end