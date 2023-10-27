# frozen_string_literal: true

User.create!(
  email: 'admin@portico.com',
  role: 'admin',
  password: 'VerySecure@2022',
  password_confirmation: 'VerySecure@2022'
)

5.times do |_d|
  Driver.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    document: Faker::Number.number(digits: 9),
    shipping_company: Faker::Company.name
  )
end

5.times do |_d|
  Vehicle.create!(
    manufacturer: Faker::Vehicle.manufacture,
    sample: Faker::Vehicle.model,
    bodywork: 'truck',
    license_plate: Faker::Vehicle.license_plate
  )
end

5.times { |_d| Customer.create!(title: Faker::Company.name, status: 'active') }

customer = Customer.all
customer.each do |c|
  Shipment.create!(
    customer_id: c.id,
    invoice_number: Faker::Invoice.reference,
    cargo_checker: Faker::Name.name,
    volume_quantity: 2,
    dock: '12',
    kind: 'receive',
    status: 'pending',
    warehouse: 'high_tech',
    driver_id: Driver.last.id,
    vehicle_id: Vehicle.last.id
  )
end
