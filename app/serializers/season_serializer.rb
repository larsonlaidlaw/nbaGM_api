class SeasonSerializer < ActiveModel::Serializer
  attributes :season, :guaranteed_salary, :salary, :player_option, :team_option, :contract_id
end
