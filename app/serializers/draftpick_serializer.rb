class DraftpickSerializer < ActiveModel::Serializer
  attributes :id, :round, :year, :team_id, :original_team
end
