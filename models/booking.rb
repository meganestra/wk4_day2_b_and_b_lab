require('pg')

class Booking

  attr_reader(:id, :guest_id, :number_of_nights, :check_in_date, :type_of_room, :breakfast)

  def initialize(options)
    @id = options["id"].to_i
    @guest_id = options["guest_id"].to_i
    @number_of_nights = options["number_of_nights"].to_i
    @check_in_date = options["check_in_date"]
    @type_of_room = options["type_of_room"]
    @breakfast = options["breakfast"]
  end

  def save()
    db = PG.connect( {dbname: 'b_and_b', host: 'localhost'} )
    sql = "INSERT INTO bookings (guest_id, number_of_nights, check_in_date, type_of_room, breakfast) VALUES ('#{@guest_id}', '#{@number_of_nights}', '#{@check_in_date}', '#{@type_of_room}', #{@breakfast}) RETURNING *"
    booking_data = db.exec(sql).first
    db.close
    # @id = booking_data.first['id'].to_i
    return Booking.new(booking_data)
  end

  def self.all()
    db = PG.connect( {dbname: 'b_and_b', host: 'localhost'} )
    sql = "SELECT * FROM bookings"
    bookings_data = db.exec(sql)
    results = bookings_data.map { |booking| Booking.new(booking) }
    db.close
    return results
  end


end








