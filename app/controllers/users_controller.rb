class UsersController < ApplicationController
  has_scope :filter_country
  has_scope :filter_username
  has_scope :filter_price, using: %i[min_price max_price], type: :hash
  has_scope :filter_game

  def index
    @users = apply_scopes(User).all
  end

  def show
    @coach = User.find_by(username: params[:username])
    @current_user = current_user

    @coach_slots = Slot.by_user(@coach)
    @available_slots = @coach_slots.available
    @available_dates = @available_slots.map { |slot| slot.date }

    @slots_booked_by_current_user = @current_user.orders.map do |order|
      order.slot if order.slot.user == @coach
    end

    @dates_booked_by_current_user = @slots_booked_by_current_user.map { |slot| slot.date }
  end
end
