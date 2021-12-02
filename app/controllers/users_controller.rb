class UsersController < ApplicationController
  has_scope :filter_country
  has_scope :filter_username
  has_scope :filter_price, using: %i[min_price max_price], type: :hash
  has_scope :filter_game

  def index
    @users = apply_scopes(User).all
  end

  def show
    @user = User.find_by(username: params[:username])
    @available_slots = Slot.by_user(@user).available
    @available_dates = @available_slots.map { |slot| slot.date }
    @order = Order.new
    @reviews = @user.reviews
  end
end
