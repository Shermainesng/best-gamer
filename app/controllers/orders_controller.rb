class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:duration)
  end
end
