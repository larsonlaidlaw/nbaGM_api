class ContractSerializer < ActiveModel::Serializer
  attributes :start_date, :no_trade, :trade_kicker, :cap_hold, :active, :two_way, :player_id, :team_id
  has_many :seasons
  has_many :dead_seasons
end
