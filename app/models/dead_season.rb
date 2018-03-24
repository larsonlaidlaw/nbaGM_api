class DeadSeason < ApplicationRecord
  belongs_to :contract
  belongs_to :player
end
