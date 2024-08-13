class CustomerAddressesController < ApplicationController
  before_action :set_address, only: %i[show edit update]

  def index = @customer = Customer.find(customer_id)
  def new = @address = Address.new

  def create
    customer = Customer.find(customer_id)
    address = customer.addresses.create(address_params)

    address_id = address.id

    if address_id != nil
      redirect_to(
        show_customer_address_path(customer_id, address_id),
        notice: "Address was successfully created.",
        status: :see_other
      )
    else
      @address = address
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    @address = Address.find(address_id)

    if @address.update(address_params)
      redirect_to(
        show_customer_address_path(customer_id, address_id),
        notice: "Address was successfully updated.",
        status: :see_other
      )
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    customer = Customer.find(customer_id)
    customer.addresses.find(address_id).destroy
    redirect_to(index_customer_address_path, notice: "Address was successfully destroyed.", status: :see_other)
  end

  private
  def customer_id = params[:customer_id]
  def address_id = params[:address_id]

  def address_params
    params.permit(
      :name,
      :address_line_1,
      :address_line_2,
      :postal_town,
      :county,
      :country,
      :post_code
    )
  end

  def set_address
    customer = Customer.find(customer_id)
    @address = customer.addresses.find(address_id)
  end

end
