require('minitest/autorun')
require_relative('../models/booking')

class TestBooking < Minitest::Test

  def setup
    @booking_1 = Booking.new( {"number_of_nights" => 1, "check_in_date" => "2016-06-06", "type_of_room" => "single", "breakfast" => true} )
  end

  def test_number_of_nights()
    assert_equal(1, @booking_1.number_of_nights())
  end

  def test_check_in_date()
    assert_equal("2016-06-06", @booking_1.check_in_date())
  end

  def test_type_of_room()
    assert_equal("single", @booking_1.type_of_room())
  end


end