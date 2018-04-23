class PlayersController < ApplicationController
  def index
    @players = Player.all
    render json: @players, include: ['contracts.seasons', 'contracts.dead_seasons']
  end

  def show
    @player = Player.find(params[:id])
    render json: @player
  end

  def show_free_agents
    @free_agents = Player.free_agents(params["seasonIndex"])
    render json: @free_agents, include: ['contracts.seasons']
  end
end
