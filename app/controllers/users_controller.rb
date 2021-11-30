class UsersController < ApplicationController
  def filter_by_game
    @game = Game.find(game_params[:id])
    @users = @game.users
  end

  private

  def game_params
    params.require(:game).permit(:id)
  end

  # def filter_games_params
  #   params.require(:)
  # end

end
