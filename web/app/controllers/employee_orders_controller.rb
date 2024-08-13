class EmployeeOrdersController < ApplicationController
  def index
    @orders = Order.where(:employee_id => employee_id)
  end

  def paid
    @orders = Order.where(:employee_id => employee_id).where.not(:paid_date => nil)
  end

  def move
    order_id = params[:order_id]
    status = params[:order][:status].to_i

    @order = Order.find(order_id)

    if status == 1
      @order.shipped_date = nil
    end

    if status == 2
      @order.shipped_date = Date.today
    end

    @order.save
  end

  def checklist
    @orders = Order.where(:employee_id => employee_id).where.not(:paid_date => nil)
  end

  private
  def employee_id = params[:employee_id]
end
