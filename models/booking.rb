require('pg')

class Booking

  attr_reader(:id, :guest_id, :number_of_nights, :check_in_date, :type_of_room, :breakfast)

  def initialize(options)
    @id = options["id"]
    @guest_id = options["guest_id"]
    @number_of_nights = options["number_of_nights"]
    @check_in_date = options["check_in_date"]
    @type_of_room = options["type_of_room"]
    @breakfast = options["breakfast"]
  end




end








