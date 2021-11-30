class UsersController < ApplicationController
  def index
    @game = Game.find_by(name: params[:game])
    @users = @game.users
  end

  def show
    @user = User.find_by(username: params[:username])
    @order = Order.new
  end

end
