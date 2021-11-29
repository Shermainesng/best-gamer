class PagesController < ApplicationController
  def home
    @game = Game.new
    @games = Game.all
  end



end
