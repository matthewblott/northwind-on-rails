class ShippersController < ApplicationController
  include Pagy::Backend
  before_action :set_shipper, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @shippers = pagy(Shipper.all, items: count)
  end

  def show
  end

  def edit
  end

  def new
    @shipper = Shipper.new
  end

  def create
    @shipper = Shipper.new(shipper_params)
    if @shipper.save
      redirect_to(show_shipper_path(@shipper), notice: "Shipper was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @shipper.update(shipper_params)
      redirect_to(show_shipper_path(@shipper), notice: "Shipper was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @shipper.destroy!
    redirect_to(index_shipper_path, notice: "Shipper was successfully destroyed.", status: :see_other)
  end

  private
  def shipper_id = params[:shipper_id]
  def set_shipper = @shipper = Shipper.find(shipper_id)
  def shipper_params = params.permit(:id, :company_name, :phone)
end
