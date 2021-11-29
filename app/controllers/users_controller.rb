class UsersController < ApplicationController
  def filter_by_game
    @game = Game.find(params[:id])
    @users = User.where(game: @game)
  end


end
