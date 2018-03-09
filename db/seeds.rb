    Profile.destroy_all
    Reservation.destroy_all
    Space.destroy_all
    User.destroy_all

     puts "Creating Users"
     emails = ["john@yadoo.com", "ringo@geemail.net", "george@zoohoo.org", "paul@yadoo.com", "bill@gmail.com", "george@yadoo.com"]
     names = ["John Lennon","Paul McCartney","Ringo Star","George W. Bush", "George Harrison"]
     emails.each {|email| User.create(email: email, password: "1234567", fullname: names.sample)}
     puts "Users made"

     puts "Creating Spaces"

     Space.create(address: "18 Falcon Grove, London SW11 2ST, UK", price: 1.5, avg_rating: 4.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "9 Glendale Dr, Wimbledon, London SW19 7BG, UK", price: 3.5, avg_rating: 2.5, parking_type: "drive", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "452 Streatham High Rd, London SW16 3NN, UK", price: 4.5, avg_rating: 3.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "St James's Park, Ivy Lodge, London SW1A 2BJ, UK", price: 5.5, avg_rating: 1.5, parking_type: "street", user: User.find_by(email: "ringo@geemail.net"))
     sleep 1.0
     Space.create(address: "13 Holmewood Rd, London SW2 3RP, UK", price: 1.5, avg_rating: 6.5, parking_type: "drive", user: User.find_by(email: "george@zoohoo.org"))
     sleep 1.0
     Space.create(address: "Polígono Industrial Zona Franca Sector B, Carrer 3, 77-111, 08040 Barcelona", price: 1.5, avg_rating: 4.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Av. del Paraŀlel, 76-78, 08001 Barcelona", price: 3.5, avg_rating: 2.5, parking_type: "drive", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Carrer de Marià Labèrnia, s/n, 08032 Barcelona", price: 4.5, avg_rating: 3.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "08024 Barcelona", price: 5.5, avg_rating: 1.5, parking_type: "street", user: User.find_by(email: "ringo@geemail.net"))
     sleep 1.0
     Space.create(address: "Parc de la Ciutadella, 08003 Barcelona", price: 1.5, avg_rating: 6.5, parking_type: "drive", user: User.find_by(email: "george@zoohoo.org"))
     sleep 1.0
     Space.create(address: "Carrer Comerç, 36, 08003 Barcelona", price: 1.5, avg_rating: 4.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Carrer de Girona, 37, 08010 Barcelona", price: 3.5, avg_rating: 2.5, parking_type: "drive", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Avinguda Diagonal, 420, 08037 Barcelona", price: 4.5, avg_rating: 3.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Avinguda Diagonal, 211, 08018 Barcelona", price: 5.5, avg_rating: 1.5, parking_type: "street", user: User.find_by(email: "ringo@geemail.net"))
     sleep 1.0
     Space.create(address: "Carrer de Zamora, 78, 08018 Barcelona", price: 1.5, avg_rating: 6.5, parking_type: "drive", user: User.find_by(email: "george@zoohoo.org"))
     sleep 1.0
     Space.create(address: "Carrer de la Ciutat de Granada, 33, 08005 Barcelona", price: 1.5, avg_rating: 4.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Spania, Carrer Mar del Albora, 347, 08918 Badalona, Barcelona", price: 3.5, avg_rating: 2.5, parking_type: "drive", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Carrer de la Indústria, 427, 08918 Badalona, Barcelona", price: 4.5, avg_rating: 3.5, parking_type: "garage", user: User.find_by(email: "john@yadoo.com"))
     sleep 1.0
     Space.create(address: "Plaça de l'Assemblea de Catalunya, 1, 08911 Badalona, Barcelona", price: 5.5, avg_rating: 1.5, parking_type: "street", user: User.find_by(email: "ringo@geemail.net"))
     sleep 1.0
     Space.create(address: "Ctra. de Mataró, Km. 629, 08911 Badalona, Barcelona", price: 1.5, avg_rating: 6.5, parking_type: "drive", user: User.find_by(email: "george@zoohoo.org"))
     puts "Spaces made"

     puts "Creating Reservations"
     Reservation.create(start: Date.new(2017,8,8), end: Date.new(2017,8,9) , status: "booked", total_cost: 31, description: "Please look after my car.", space: Space.find_by(address: "London"), user: User.find_by(email: "george@yadoo.com"))
     Reservation.create(start: Date.new(2017,7,7), end: Date.new(2017,7,8), status: "submitted", total_cost: 21, description: "Please look after my limo.", space: Space.find_by(address: "London"), user: User.find_by(email: "bill@gmail.com"))
     Reservation.create(start: Date.new(2017,6,6), end: Date.new(2017,6,7), status: "new", total_cost: 41, description: "Please look after my bike.", space: Space.find_by(address: "Paris"), user: User.find_by(email: "bill@gmail.com"))
     Reservation.create(start: Date.new(2017,5,5), end: Date.new(2017,5,6), status: "booked", total_cost: 11, description: "Please look after my wheels.", space: Space.find_by(address: "Berlin"), user: User.find_by(email: "john@yadoo.com"))

     puts "Reservations made"


    puts "Creating Profiles"

    names = ["Bill","Jenny","Kyle","Fran","Jess"]

    emails.each do |email|

      Profile.create(phone: "12345567", description: "Shazam for food", avatar: "http://siliconvalleyism.com/characters/jian-yang-small.jpg", user: User.find_by(email: email))

    end
    puts "Profiles made"

#       t.string :phone
#       t.text :description
#       t.string :avatar
