class UsersController < ApplicationController
  def index
    @game = Game.find_by(name: params[:game])
    @users = @game.users
  end

  def show
    @user = User.find(params["id"])
  end

  private



  # def filter_games_params
  #   params.require(:)
  # end

end
