FactoryBot.define do
  factory :address do
    name { "123 Main St" }
    address_line_1 { "123 Main St" }
    address_line_2 { "" }
    postal_town { "San Francisco" }
    county { "CA" }
    post_code { "94105" }
    country { "USA" }
    # Add other attributes as necessary.
  end
end