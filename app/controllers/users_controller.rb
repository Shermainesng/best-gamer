class UsersController < ApplicationController
  def filter_by_game
    @game = Game.find(game_params[:id])
    @users = User.where(game: @game)
  end

  def game_params
    params.require(:game).permit(:id)
  end
end
