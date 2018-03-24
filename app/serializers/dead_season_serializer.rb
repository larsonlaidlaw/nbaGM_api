class DeadSeasonSerializer < ActiveModel::Serializer
  attributes :id, :season, :cap_hit, :player
end
