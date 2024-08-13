class OrderItemsController < ApplicationController
  include Pagy::Backend
  before_action :set_order_item, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @order_items = pagy(OrderItem.includes(:product).by_order(order_id), items: count)
  end

  def new
    @order_item = OrderItem.new
    @order_item.order_id = order_id
  end

  def create
    @order_item = OrderItem.new(order_item_params)

    if @order_item.save
      redirect_to(show_order_item_path(:product_id => @order_item.product_id), notice: "Item was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @order_item.update(order_item_params)
      redirect_to(show_order_item_path(@order_item), notice: "Item was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @order_item.destroy!
    redirect_to(index_order_item_path, notice: "Item was successfully destroyed.", status: :see_other)
  end

  private
  def order_id = params[:order_id]
  def product_id = params[:product_id]
  def order_item_params = params.permit(:order_id, :product_id, :quantity, :unit_price, :discount)
  def set_order_item = @order_item = OrderItem.find([order_id, product_id])
end
