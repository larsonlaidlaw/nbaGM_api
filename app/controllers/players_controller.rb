class PlayersController < ApplicationController
  def index
    @players = Player.all
    render json: @players, include: ['contracts.seasons', 'contracts.dead_seasons']
  end

  def show
    @player = Player.find(params[:id])
    render json: @player
  end
end
