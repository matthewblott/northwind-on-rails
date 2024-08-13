class ProductsController < ApplicationController
  include Pagy::Backend
  before_action :set_product, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @products = pagy(Product.all, items: count)
  end

  def search
    q = params[:q]
    products = if q.present?
      Product.name_like(q)
    else
      []
    end

    items = {}
    products.map { |product| items[product.id] = product.product_code }

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "product_search_results",
            partial: "search_results",
            locals: {items: items, q: q}
          )
        )
      end
    end
  end

  def new = @product = Product.new

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to(show_product_path(@product), notice: "Product was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @product.update(product_params)
      redirect_to(show_product_path(@product), notice: "Product was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @product.destroy!
    redirect_to(index_product_path, notice: "Product was successfully destroyed.", status: :see_other)
  end

  private
  def product_id = params[:product_id]
  def set_product = @product = Product.find(product_id)

  def product_params
    params.permit(
      :product_code,
      :product_name,
      :description,
      :standard_cost,
      :list_price,
      :discontinued
    )
  end
end
