User.create!(
  email: "admin@portico.com",
  password: "VerySecure@2022",
  password_confirmation: "VerySecure@2022",
)

5.times do |d|
  Driver.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    document: Faker::Number.number(digits: 9),
    shipping_company: Faker::Company.name,
  )
end

5.times do |d|
  Vehicle.create!(
    manufacturer: Faker::Vehicle.manufacture,
    sample: Faker::Vehicle.model,
    bodywork: "truck",
    license_plate: Faker::Vehicle.license_plate,
  )
end

5.times { |d| Customer.create!(title: Faker::Company.name) }

customer = Customer.all
customer.each do |c|
  Shipment.create!(
    customer_id: c.id,
    invoice_number: Faker::Invoice.reference,
    cargo_checker: Faker::Name.name,
    dock: "12",
    kind: "receive",
    status: "pending",
    warehouse: "high_tech",
    driver_id: Driver.last.id,
    vehicle_id: Vehicle.last.id,
  )
end
