class EmployeeAddressesController < ApplicationController
  include Pagy::Backend
  before_action :set_address, only: %i[show edit]

  def index
    @employee = Employee.find(employee_id)
  end

  def show
  end

  def edit
  end

  def new
    @address = Address.new
  end

  def create
    employee = Employee.find(employee_id)
    address = employee.addresses.create(address_params)

    address_id = address.id

    if address_id != nil
      redirect_to(
        show_employee_address_path(employee_id, address_id),
        notice: "Address was successfully created.",
        status: :see_other
      )
    else
      @address = address
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    employee = Employee.find(employee_id)
    if employee.addresses.update(address_params)
      redirect_to(
        show_employee_address_path(employee_id, address_id),
        notice: "Address was successfully updated.",
        status: :see_other
      )
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    employee = Employee.find(employee_id)
    employee.addresses.find(address_id).destroy
    redirect_to(index_employee_address_path, notice: "Address was successfully destroyed.", status: :see_other)
  end

  private
  def employee_id = params[:employee_id]
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
    employee = Employee.find(employee_id)
    @address = employee.addresses.find(address_id)
  end
end
