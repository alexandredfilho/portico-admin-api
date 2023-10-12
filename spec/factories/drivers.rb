FactoryBot.define do
  factory :driver do
    document { "123456789" }
    first_name { "Han" }
    last_name { "Solo" }
    shipping_company { "XPTO Log" }
  end
end
