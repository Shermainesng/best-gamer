class UsersController < ApplicationController
  def index
    @game = Game.find_by(name: params[:game])
    @users = @game.users
  end

  private



  # def filter_games_params
  #   params.require(:)
  # end

end
