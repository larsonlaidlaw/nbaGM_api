class Contract < ApplicationRecord
  belongs_to :player
  belongs_to :team
  has_many :seasons, -> { order(season: :asc) }
  has_many :dead_seasons, -> { order(season: :asc) }
end
