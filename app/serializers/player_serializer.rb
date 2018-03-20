class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :slug, :experience, :team_id
  has_many :contracts
end
