FactoryBot.define do
  factory :shipment do
    association :customer, factory: :customer
    association :driver, factory: :driver
    association :vehicle, factory: :vehicle

    cargo_checker { "John Doe" }
    dock { "2" }
    invoice_number { "12345" }
    kind { "delivery" }
    warehouse { "high-tech" }
  end
end
