json = ActiveSupport::JSON.decode(File.read('./db/seeds/seeds.json'))

def make_team_slug(slug)
  slug = slug.downcase
  slug = slug.split(" ")
  slug = slug[0]
  slug=slug.split('')
  slug=slug.slice(0,3)
  slug=slug.join('')
end

def make_team_nickname(team)
  nickname = team.split(" ")
  nickname = nickname.last.downcase
end

def make_player_slug(slug)
  slug = slug.downcase
  slug = slug.split(' ')
  slug = slug.join('_')
end

json.each do |team|
  # team_slug = make_team_slug(team["team_name"])
  nickname = make_team_nickname(team["team_name"])

  team_var = Team.create({
    team_name: team["team_name"],
    nickname: nickname
  })

  puts "#{team["team_name"]} added"

  team["players"].each do |player|
    player_slug = make_player_slug(player["name"])

    player_var = Player.create({
      name: player["name"],
      birth_date: player["birthday"],
      slug: player_slug,
      experience: player["experience"].to_i,
      team_id: team_var.id
    })

    puts "#{player["name"]} added"

    contract_var = Contract.create({
      start_date: 'Jul/1/2015',
      no_trade: false,
      trade_kicker: 1,
      active: true,
      two_way: false,
      player_id: player_var.id
    })

    puts "#{player["name"]}'s contract added"

    if player["contract"] != nil

      player["contract"].each do |season|
        salary_var = season["salary"].split(",")
        salary_var = salary_var.join('')
        salary_var.slice!(0)

        season_var = Season.create({
          season: season["season"],
          guaranteed_salary: salary_var,
          salary: salary_var,
          player_option: season["player_option"],
          team_option: season["team_option"],
          contract_id: contract_var.id
          })

          puts "#{player["name"]}'s contract year #{season["season"]}added"
        end
      end
    end
  puts '******************************************************'
end

team_id = 1
30.times do
  year = 2018
  7.times do
    Draftpick.create({
      year: year,
      team_id: team_id,
      original_team: team_id,
      round: 1
    })
    Draftpick.create({
      year: year,
      team_id: team_id,
      original_team: team_id,
      round: 2
    })
    year += 1
  end
  team_id += 1
end