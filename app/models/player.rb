class Player < ApplicationRecord
  belongs_to :team
  has_many :contracts

  def self.free_agents(seasonIndex)
    find_by_sql <<-SQL
      select players.*
      from players, (
        select players.id p, count(seasons.id) s
        from players, contracts, seasons
        where players.id = contracts.player_id
        and contracts.id = seasons.contract_id
        group by players.id) x
        where players.id = x.p
        and x.s = #{seasonIndex};
    SQL
  end

  # def self.free_agents
  #   all.select do |p|
  #     c = p.contracts.first
  #     c && c.seasons.count <= 1
  #   end
  # end

end
