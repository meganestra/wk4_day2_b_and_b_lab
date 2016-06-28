require('pg')

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

end