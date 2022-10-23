# Remove all customers and their payments from the DB
Customer.destroy_all
puts "Removed all existing Customers from DB ✅"

Customer.create!(first_name: "Jordan", last_name: "Carpenter")
Customer.create!(first_name: "Rigoberto", last_name: "Wolfe")
Customer.create!(first_name: "Mitchell", last_name: "Hill")
Customer.create!(first_name: "Zelma", last_name: "Ferguson")
Customer.create!(first_name: "Andrea", last_name: "Carey")
Customer.create!(first_name: "Chung", last_name: "Cabrera")
Customer.create!(first_name: "Lindsey", last_name: "Barajas")
Customer.create!(first_name: "Kendall", last_name: "Hood")
Customer.create!(first_name: "Robbie", last_name: "Duran")
Customer.create!(first_name: "Marion", last_name: "Crawford")
Customer.create!(first_name: "Tanya", last_name: "Kelly")
Customer.create!(first_name: "Shelton", last_name: "Wang")
Customer.create!(first_name: "Cornelius", last_name: "Bennett")
Customer.create!(first_name: "Rhea", last_name: "Moore")
Customer.create!(first_name: "Molly", last_name: "Medina")
Customer.create!(first_name: "Katy", last_name: "Dunn")
Customer.create!(first_name: "Wilbur", last_name: "Barnett")
Customer.create!(first_name: "Logan", last_name: "Soto")
Customer.create!(first_name: "Ivy", last_name: "Myers")
Customer.create!(first_name: "Deana", last_name: "Lopez")
puts "Seeded DB with 20 Customers ✅"

# Generate 1-3 PaymentRequests for every customer
Customer.all.each do |customer|
  # Generate a random number between 1 and 3
  n = (1 + rand * 3).floor

  # Generate n PaymentRequests for a given customer
  n.times do |i|
    customer.payment_requests.create!(
      amount: (rand * 1_000_000).floor,
      status: PaymentRequest.statuses.keys.sample
    )
  end
end
puts "Seeded DB with Payment Requests ✅"
