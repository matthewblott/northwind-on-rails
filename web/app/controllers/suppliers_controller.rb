class SuppliersController < ApplicationController
  include Pagy::Backend
  before_action :set_supplier, only: %i[show edit update destroy]

  def index
    count = 10
    counted = true 
    if counted
      @pagy, @suppliers = pagy(Supplier.all, items: count)
    else
      @pagy, @suppliers = pagy_countless(Supplier.all, items: count)
    end
  end

  def new = @supplier = Supplier.new

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to(@supplier, notice: "Supplier was successfully created.", status: :see_other)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to(show_supplier_path(@supplier), notice: "Supplier was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @supplier.destroy!
    redirect_to(index_supplier_path, notice: "Supplier was successfully destroyed.", status: :see_other)
  end

  private
  def supplier_id = params[:supplier_id]
  def set_supplier = @supplier = Supplier.find(supplier_id)
  def supplier_params
    params.permit(
      :company_name,
      :contact_name,
      :contact_title,
      :region,
      :phone,
      :fax,
      :homepage
    )
  end
end
