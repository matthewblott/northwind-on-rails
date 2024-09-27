FactoryBot.define do
  factory :product do
    product_code { "PROD12345" }
    product_name { "Sample Product" }
    description { "This is a sample product description." }
    standard_cost { 50.0 }
    list_price { 100.0 }
    discontinued { false }
  end
end