require('minitest/autorun')
require_relative('../models/guest')

class TestGuest < Minitest::Test

  def setup
    @guest = Guest.new({"first_name" => "Megan", "last_name" => "Strachan"})
  end

  def test_first_name()
    assert_equal("Megan", @guest.first_name())
  end

  def test_last_name()
    assert_equal("Strachan", @guest.last_name())
  end

  def test_full_name()
    assert_equal("Megan Strachan", @guest.full_name())
  end

end