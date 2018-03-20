class ContractSerializer < ActiveModel::Serializer
  attributes :start_date, :no_trade, :trade_kicker, :active, :two_way, :player_id
  has_many :seasons
end
