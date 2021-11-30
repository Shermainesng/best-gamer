class UsersController < ApplicationController
  def filter_by_game

    @game = Game.find(game_params[:id])
    @users = @game.users
    # redirect_to 'co'
  end

  private
  def game_params
    params.require(:game).permit(:id)
  end

end
