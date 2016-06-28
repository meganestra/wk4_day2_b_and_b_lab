require('pg')
require_relative('booking')

class Guest

  attr_reader(:id, :first_name, :last_name)

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def full_name()
    return "#{first_name} #{last_name}"
  end

  def save()
    db = PG.connect( {dbname: 'b_and_b', host: 'localhost'} )
    sql = "INSERT INTO guests (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING *"
    guests_data = db.exec(sql)
    db.close
    @id = guests_data.first['id'].to_i
  end

  def self.all()
    db = PG.connect( {dbname: 'b_and_b', host: 'localhost'} )
    sql = "SELECT * FROM guests"
    guests_data = db.exec(sql)
    results = guests_data.map { |guest| Guest.new(guest) }
    db.close
    return results
  end

  def bookings()
    db = PG.connect( {dbname: 'b_and_b', host: 'localhost'} )
    sql = "SELECT * FROM bookings WHERE guest_id = #{@id}"
    bookings_data = db.exec(sql)
    results = bookings_data.map { |booking| Booking.new(booking) }
    db.close
    return results
  end

end








