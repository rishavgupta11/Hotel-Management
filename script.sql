-- Create the database
CREATE DATABASE hotel_management;

-- Use the database
USE hotel_management;

-- Create the tables
CREATE TABLE hotels (
  hotel_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  rating INT
);

CREATE TABLE rooms (
  hotel_id INT,
  room_number INT,
  type VARCHAR(255),
  price DECIMAL(10,2),
  PRIMARY KEY (hotel_id, room_number),
  FOREIGN KEY (hotel_id) REFERENCES hotels (hotel_id)
);

CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255)
);
CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  hotel_id INT,
  room_number INT,
  booking_date DATE,
  checkin_date DATE,
  checkout_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (hotel_id, room_number) REFERENCES rooms (hotel_id, room_number)
);
CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT,
  payment_date DATE,
  amount DECIMAL(10,2),
  FOREIGN KEY (booking_id) REFERENCES bookings (booking_id)
);

-- Insert data into the tables
INSERT INTO hotels (name, location, rating)
VALUES ('Hotel A', 'Delhi', 5),
('Hotel B', 'Mumbai', 4),
('Hotel C', 'Chennai', 3),
('Hotel D', 'Kolkata', 3),
('Hotel E', 'Hyderabad', 2);

INSERT INTO rooms (hotel_id, room_number, type, price)
VALUES (1, 101, 'Deluxe', 5000.00),
(1, 102, 'Suite', 6000.00),
(1, 103, 'Standard', 4000.00),
(2, 101, 'Deluxe', 4500.00),
(2, 102, 'Suite', 5500.00),
(3, 101, 'Deluxe', 4000.00),
(3, 102, 'Suite', 5000.00),
(4, 101, 'Deluxe', 3500.00),
(4, 102, 'Suite', 4500.00),
(5, 101, 'Deluxe', 3000.00);

INSERT INTO customers (name, email, phone)
VALUES ('Customer A', 'a@gmail.com', '1234567890'),
('Customer B', 'b@gmail.com', '1234567891'),
('Customer C', 'c@gmail.com', '1234567892'),
('Customer D', 'd@gmail.com', '1234567893'),
('Customer E', 'e@gmail.com', '1234567894'),
('Customer F', 'f@gmail.com', '1234567895'),
('Customer G', 'g@gmail.com', '1234567896'),
('Customer H', 'h@gmail.com', '1234567897'),
('Customer I', 'i@gmail.com', '1234567898'),
('Customer J', 'j@gmail.com', '1234567899');

INSERT INTO bookings (customer_id, hotel_id, room_number, booking_date, checkin_date, checkout_date)
VALUES (1, 1, 101, '2022-12-01', '2022-12-15', '2022-12-20'),
(2, 1, 102, '2022-12-02', '2022-12-16', '2022-12-22');
-- Insert the remaining data into the bookings table
INSERT INTO bookings (customer_id, hotel_id, room_number, booking_date, checkin_date, checkout_date)
VALUES (3, 1, 103, '2022-12-03', '2022-12-17', '2022-12-24'),
(4, 2, 101, '2022-12-04', '2022-12-18', '2022-12-26'),
(5, 2, 102, '2022-12-05', '2022-12-19', '2022-12-28'),
(6, 3, 101, '2022-12-06', '2022-12-20', '2022-12-30'),
(7, 3, 102, '2022-12-07', '2022-12-21', '2022-12-31'),
(8, 4, 101, '2022-12-08', '2022-12-22', '2023-01-02'),
(9, 4, 102, '2022-12-09', '2022-12-23', '2023-01-04'),
(10, 5, 101, '2022-12-10', '2022-12-24', '2023-01-06');
-- Insert data into the payments table
INSERT INTO payments (booking_id, payment_date, amount)
VALUES (1, '2022-12-01', 5000.00),
(2, '2022-12-02', 6000.00),
(3, '2022-12-03', 4000.00),
(4, '2022-12-04', 4500.00),
(5, '2022-12-05', 5500.00),
(6, '2022-12-06', 4000.00),
(7, '2022-12-07', 5000.00),
(8, '2022-12-08', 3500.00),
(9, '2022-12-09', 4500.00),
(10, '2022-12-10', 3000.00);
