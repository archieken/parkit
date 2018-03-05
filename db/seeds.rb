    Reservation.destroy_all
    Space.destroy_all
    User.destroy_all

     puts "Creating Users"
     emails = ["john@yadoo.com", "ringo@geemail.net", "george@zoohoo.org", "paul@yadoo.com", "bill@gmail.com", "george@yadoo.com"]
     emails.each {|email| User.create(email: email, password: "1234567")}
     puts "Users made"

     puts "Creating Spaces"
     Space.create(address: "London", price: 1.5, photo: "image", avg_rating: 4.5, user: User.find_by(email: "john@yadoo.com"))
     Space.create(address: "Paris", price: 3.5, photo: "image", avg_rating: 2.5, user: User.find_by(email: "john@yadoo.com"))
     Space.create(address: "Berlin", price: 4.5, photo: "image", avg_rating: 3.5, user: User.find_by(email: "john@yadoo.com"))
     Space.create(address: "New York", price: 5.5, photo: "image", avg_rating: 1.5, user: User.find_by(email: "ringo@geemail.net"))
     Space.create(address: "Cheltenham", price: 1.5, photo: "image", avg_rating: 6.5, user: User.find_by(email: "george@zoohoo.org"))
     puts "Spaces made"

     puts "Creating Reservations"
     Reservation.create(start: Date.new(2017,8,8), end: Date.new(2017,8,9) , status: "booked", total_cost: 31, description: "Please look after my car.", space: Space.find_by(address: "London"), user: User.find_by(email: "george@yadoo.com"))
     Reservation.create(start: Date.new(2017,7,7), end: Date.new(2017,7,8), status: "submitted", total_cost: 21, description: "Please look after my limo.", space: Space.find_by(address: "London"), user: User.find_by(email: "bill@gmail.com"))
     Reservation.create(start: Date.new(2017,6,6), end: Date.new(2017,6,7), status: "new", total_cost: 41, description: "Please look after my bike.", space: Space.find_by(address: "Paris"), user: User.find_by(email: "bill@gmail.com"))
     Reservation.create(start: Date.new(2017,5,5), end: Date.new(2017,5,6), status: "booked", total_cost: 11, description: "Please look after my wheels.", space: Space.find_by(address: "Berlin"), user: User.find_by(email: "john@yadoo.com"))

     puts "Reservations made"
