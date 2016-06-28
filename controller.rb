require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./models/guest')
require_relative('./models/booking')

get '/booking/new' do

  erb(:new)
end

post '/booking' do
  @guest = Guest.new(params)
  @guest.save()
  params['guest_id'] = @guest.id
  @booking = Booking.new(params)
  @booking.save()

  erb(:create)
end

get '/booking' do
  @guests = Guest.all()
  erb(:index)
end


