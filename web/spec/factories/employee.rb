
FactoryBot.define do
  factory :employee do
    email { 'test@example.com' }
    first_name { 'John' }
    last_name { 'Doe' }   
    password { 'password' }
    password_confirmation { 'password' }
    association :region
  end
end
