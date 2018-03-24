class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :nickname
  has_many :players
  has_many :draftpicks
  has_many :contracts 
end
