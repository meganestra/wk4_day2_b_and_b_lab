DROP TABLE bookings;
DROP TABLE guests;


CREATE TABLE guests (
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL4 primary key,
  guest_id INT4 references guests(id),
  number_of_nights INT2 not null,
  check_in_date DATE not null,
  type_of_room VARCHAR(255) not null,
  breakfast BOOLEAN not null
);

