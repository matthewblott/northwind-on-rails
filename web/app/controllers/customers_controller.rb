class CustomersController < ApplicationController
  include Pagy::Backend

  before_action :set_customer, only: %i[show edit update destroy]
  
  def index
    count = 10
    @pagy, @customers = pagy(Customer.all, items: count)
  end

  def search
    q = params[:q]

    customers = if q.present?
      Customer.name_like(q)
    else
      []
    end

    items = {}
    customers.map { |customer| items[customer.id] = customer.company_name }

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "customer_search_results",
            partial: "search_results",
            locals: {items: items, q: q}
          )
        )
      end
    end
  end

  def show
  end

  def edit
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to(show_customer_path(@customer), notice: "Customer was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to(show_customer_path(@customer), notice: "Customer was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @customer.destroy!
    redirect_to(index_customer_path, notice: "Customer was successfully destroyed.", status: :see_other)
  end

  private
  def set_customer = @customer = Customer.find(customer_id)
  def customer_id = params[:customer_id]
  def customer_params
    params.permit(
      :id,
      :company_name,
      :contact_name,
      :contact_title,
      :customer,
      :phone,
      :fax
    )
  end
end
