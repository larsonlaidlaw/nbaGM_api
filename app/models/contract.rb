class Contract < ApplicationRecord
  belongs_to :player
  has_many :seasons
end
