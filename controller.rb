require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/guest')
require_relative('./models/booking')

get '/booking/new' do
  erb(:new)
end



