class Team < ApplicationRecord
  has_many :players, -> { order(experience: :desc)}
  # has_many :players, -> { order(contracts.first.seasons.first.salary: :desc)}
  has_many :draftpicks, -> { order(year: :asc, round: :asc)}
  has_many :contracts
end


# has_many :seasons, -> { order(season: :asc) }
