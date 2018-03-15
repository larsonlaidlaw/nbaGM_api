class TeamsController < ApplicationController
  def index
    @teams = Team.all
    render json: @teams.as_json(except: [:created_at, :updated_at])
  end

  def show
    @team = Team.find(params[:id])
    render json: @team.as_json(
      except: [:id, :created_at, :updated_at],
      include: {
        players: {
          except: [:created_at, :updated_at, :team_id],
          include: {
            contracts: {
              except: [:id, :created_at, :updated_at, :player_id],
              include: {
                seasons: {
                except: [:id, :contract_id, :created_at, :updated_at]
                }
              }
            }
          }
        }
      }
    )
  end
end
