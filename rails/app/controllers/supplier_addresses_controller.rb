class SupplierAddressesController < ApplicationController
  before_action :set_address, only: %i[show edit]

  def index = @supplier = Supplier.find(supplier_id)
  def show = return
  def edit = return
  def new = (@address = Address.new)

  def create
    supplier = Supplier.find(supplier_id)
    address = supplier.addresses.create(address_params)
    address_id = address.id

    if address_id != nil
      redirect_to(
        show_supplier_address_path(supplier_id, address_id),
        notice: "Address was successfully created.",
        status: :see_other
      )
    else
      @address = address
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    supplier = Supplier.find(supplier_id)
    if supplier.addresses.update(address_params)
      redirect_to(
        show_supplier_address_path(supplier_id, address_id),
        notice: "Address was successfully updated.",
        status: :see_other
      )
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    supplier = Supplier.find(supplier_id)
    supplier.addresses.find(address_id).destroy
    redirect_to(index_supplier_address_path, notice: "Address was successfully destroyed.", status: :see_other)
  end

  private
  def supplier_id = params[:supplier_id]
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
    supplier = Supplier.find(supplier_id)
    @address = supplier.addresses.find(address_id)
  end
end
