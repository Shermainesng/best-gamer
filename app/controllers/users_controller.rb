class UsersController < ApplicationController
  def index
    @game = Game.find_by(name: params[:game])
    @users = @game.users

    if params[:username].present? && params[:country].present?
      @users = @users.find_by(username: params[:username], country: params[:country])
    elsif params[:username].present?
      @users = @users.find_by(username: params[:username])
    elsif params[:country].present?
      @users = @users.find_by(country: params[:country])
    else
      @users
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    @order = Order.new
  end

end
