# =============================================================================
# Categories
# =============================================================================

category_id = 1

categories = []

100.times do
  categories <<
    Category.create(
      :id => category_id,
      :category_name => Faker::Commerce.department,
      :description => Faker::Lorem.sentence
    )

  category_id += 1
end

# ============================================================================
# Regions
# ============================================================================

region_id = 1

regions = []

20.times do
  regions << Region.create(
    :id => region_id,
    :name => Faker::Address.country
  )

  region_id += 1
end

# =============================================================================
# Shippers
# =============================================================================

shipper_id = 1

shippers = []

100.times do
  shippers << Shipper.create(
    :id => shipper_id,
    :company_name => Faker::Company.name,
    :phone => Faker::PhoneNumber.phone_number
  )

  shipper_id += 1
end

# =============================================================================
# Suppliers
# =============================================================================

suppliers = []

100.times do
  Supplier.create(
    :company_name => Faker::Company.name,
    :contact_name => Faker::Name.name,
    :contact_title => Faker::Job.title,
    :region => Faker::Address.state,
    :phone => Faker::PhoneNumber.phone_number,
    :fax => Faker::PhoneNumber.phone_number,
    :homepage => Faker::Internet.url
  )
end

# =============================================================================
# Supplier Addresses
# =============================================================================

suppliers.each do |supplier|
  supplier.addresses.create(
    :name => Faker::Name.name,
    :address_line_1 => Faker::Address.street_address,
    :address_line_2 => Faker::Address.secondary_address,
    :postal_town => Faker::Address.city,
    :county => Faker::Address.state,
    :post_code => Faker::Address.zip,
    :country => Faker::Address.country
  )
end

# =============================================================================
# Employees
# =============================================================================

employee_id = 201

default_password = "password"

employees = []

20.times do

  random_region_index = Random.rand(1..regions.count)
  random_region = regions[random_region_index - 1]
  random_region_id = random_region.id

  employees <<
    Employee.create(
      :id => employee_id,
      :email => Faker::Internet.unique.email,
      :password => default_password,
      :password_confirmation => default_password,
      :last_name => Faker::Name.last_name,
      :first_name => Faker::Name.first_name,
      :title => Faker::Job.title,
      :title_of_courtesy => Faker::Name.prefix,
      :birth_date => Faker::Date.between(from: 65.years.ago, to: 18.years.ago),
      :hire_date => Faker::Date.between(from: 25.years.ago, to: 1.month.ago),
      :region_id => random_region_id,
      :home_phone => Faker::PhoneNumber.phone_number,
      :extension => Faker::Number.number(digits: 3)
    )

  employee_id += 1
end

[201, 203, 204, 205, 208].each do |id|
  Employee.find(id).update_column(:reports_to, 202)
end

[206, 209].each do |id|
  Employee.find(id).update_column(:reports_to, 205)
end

Employee.find(201).update_column(:email, "admin@example.com")

# =============================================================================
# Employee Addresses
# =============================================================================

employees.each do |employee|
  employee.addresses.create(
    :name => Faker::Name.name,
    :address_line_1 => Faker::Address.street_address,
    :address_line_2 => Faker::Address.secondary_address,
    :postal_town => Faker::Address.city,
    :county => Faker::Address.state,
    :post_code => Faker::Address.zip,
    :country => Faker::Address.country
  )
end

# =============================================================================
# Customers
# =============================================================================

customers = []

100.times do
  customers <<
    Customer.create(
      :id => Faker::Alphanumeric.unique.alpha(number: 5).upcase,
      :company_name => Faker::Company.name,
      :contact_name => Faker::Name.name,
      :contact_title => Faker::Job.title,
      :region => Faker::Address.state,
      :phone => Faker::PhoneNumber.phone_number,
      :fax => Faker::PhoneNumber.phone_number
    )
end

# =============================================================================
# Customer Addresses
# =============================================================================

customers.each do |customer|
  customer.addresses.create(
    :name => Faker::Name.name,
    :address_line_1 => Faker::Address.street_address,
    :address_line_2 => Faker::Address.secondary_address,
    :postal_town => Faker::Address.city,
    :county => Faker::Address.state,
    :post_code => Faker::Address.zip,
    :country => Faker::Address.country
  )
end

# ============================================================================
# Addresses
# =============================================================================

addresses = []

100.times do
  addresses <<
    Address.create(
      :name => Faker::Name.name,
      :address_line_1 => Faker::Address.street_address,
      :address_line_2 => Faker::Address.secondary_address,
      :postal_town => Faker::Address.city,
      :county => Faker::Address.state,
      :post_code => Faker::Address.zip,
      :country => Faker::Address.country
    )
end

# ============================================================================
# Products
# =============================================================================

product_id = 1

products = []

100.times do
  products <<
    Product.create(
      :id => product_id,
      :product_code => Faker::Alphanumeric.unique.alphanumeric(number: 12).upcase,
      :product_name => Faker::Commerce.product_name,
      :description => Faker::Lorem.sentence,
      :standard_cost => Faker::Commerce.price,
      :list_price => Faker::Commerce.price,
      :discontinued => Faker::Boolean.boolean
    )

  product_id += 1
end

# =============================================================================
# Orders
# =============================================================================

order_id = 4001

orders = []

20.times do

  random_employee_index = Random.rand(1..employees.count)
  random_employee = employees[random_employee_index - 1]
  random_employee_id = random_employee.id

  random_customer_index = Random.rand(1..customers.count)
  random_customer = customers[random_customer_index - 1]
  random_customer_id = random_customer.id

  random_address_index = Random.rand(1..addresses.count)
  random_address = addresses[random_address_index - 1]
  random_address_id = random_address.id

  orders <<
    Order.create(
      :id => order_id,
      :employee_id => random_employee_id,
      :customer_id => random_customer_id,
      :order_date => Faker::Date.between(from: 25.years.ago, to: 1.year.ago),
      :shipped_date => Faker::Date.between(from: 25.years.ago, to: 1.month.ago),
      :address_id => random_address_id,
      :shipping_fee => Faker::Commerce.price,
      :payment_type => Faker::Subscription.payment_method,
      :paid_date => Faker::Date.between(from: 25.years.ago, to: 1.year.ago),
      :order_status => Faker::Lorem.word
    )

  order_id += 1
end

# =============================================================================
# Order Items
# =============================================================================

orders.each do |order|

  random_product_index = Random.rand(1..products.count)
  random_product = products[random_product_index - 1]
  random_product_id = random_product.id

  OrderItem.create(
    :order_id => order.id,
    :product_id => random_product_id,
    :quantity => Faker::Number.number(digits: 2),
    :unit_price => Faker::Commerce.price,
    :discount => Faker::Commerce.price,
    :order_item_status => Faker::Lorem.word,
    :date_allocated => Faker::Date.between(from: 25.years.ago, to: 1.year.ago)
  )
end

10.times do
  random_order_index = Random.rand(1..orders.count)
  random_order = orders[random_order_index - 1]
  random_order_id = random_order.id

  random_product_index = Random.rand(1..products.count)
  random_product = products[random_product_index - 1]
  random_product_id = random_product.id

  OrderItem.create(
    :order_id => random_order_id,
    :product_id => random_product_id,
    :quantity => Faker::Number.number(digits: 2),
    :unit_price => Faker::Commerce.price,
    :discount => Faker::Commerce.price,
    :order_item_status => Faker::Lorem.word,
    :date_allocated => Faker::Date.between(from: 25.years.ago, to: 1.year.ago)
  )
end

# =============================================================================
# Product Categories
# =============================================================================

# product_id = 1
#
# 100.times do
#
#   ProductCategory.create(
#     :product_id => product_id,
#     :category_id => category_id
#   )
#
#   product_id += 1
# end
