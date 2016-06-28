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

end