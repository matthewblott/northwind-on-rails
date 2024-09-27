FactoryBot.define do
  factory :customer do
    id { "123" }
    company_name { "Test Company" }
    contact_name { "Test Contact" }
    contact_title { "Test Title" }
    region { "Test Region" }
    phone { "1234567890" }
    fax { "1234567890" }
    # Add other required attributes as necessary.
  end

end