class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @order.slot = Slot.find(params[:slot_id].to_i)
    @slot = @order.slot
    @order.paid_amount = @slot.duration * @slot.user.rates
  end

  def create
    @slot = Slot.find(params[:slot_id])
    @order = Order.new
    @order.slot = @slot
    @order.user = current_user
    @order.paid_amount = @slot.user.rates * @slot.duration
    @order.status = "pending"

    if @order.save!
      @order.slot.booked = true
      @order.slot.save
      @session = Stripe::Checkout::Session.create({
        line_items: [{
          # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
          price_data: {
            currency: 'usd',
            product_data: {
              name: "session with #{@slot.user.username}"
            },
            unit_amount: @slot.user.rates * @slot.duration.to_i * 100
          },
          quantity: 1
        }],
        mode: 'payment',
        success_url: "#{root_url}success.html",
        cancel_url: "#{root_url}cancel.html"
      })
      redirect_to @session.url
      else
        render :new
      end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders
  end

  def confirmed
    @slot = Slot.find(params[:slot_id])
    @order = @slot.order
    @order.status = "confirmed"
    @order.save!
  end

  private

  def order_params
    params.require(:order).permit(:slot_id)
  end
end
