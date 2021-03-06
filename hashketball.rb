require 'pry'

def game_hash

hash = {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
        },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismack Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
        },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
    }
  }
}
end


#puts game_hash[:home][:players].to_a
def num_points_scored(player)
  points = ""
  game_hash.each do |team, info|
    info.each do |description, data|
      if description == :players
        if data.include?(player)
          points = data[player][:points]
        end
      end
    end
  end
  points.to_i
end
#num_points_scored("Alan Anderson")

def shoe_size(player)
  size = ""
  game_hash.each do |team, info|
    info.each do |description, data|
      if description == :players
        if data.include?(player)
          size = data[player][:shoe]
        end
      end
    end
  end
  size.to_i  
end

def team_colors(team_name)
  colors = []
  game_hash.each do |team, info|
    info.each do |description, data|
      if description == :team_name
        if data.include?(team_name)
          colors << info[:colors]   
        end
      end
    end
  end
  colors.flatten
end

def team_name
  names = []
  game_hash.each do |status, team_info|
    team_info.each do |description, data|
      if description == :team_name
        names << team_info[:team_name]
      end
    end
  end
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, team_info|
    team_info.each do |description, data|
      if data.include?(team_name)
        team_info.each do |description, data|
          if description == :players
            data.each do |player, stats|
              numbers << stats[:number]
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(player_name)
  statistics = []
  game_hash.each do |team, team_info|
   team_info.each do |description, data|
     if description == :players
       data.each do |player, stats|
         if player == player_name
            statistics = stats
         end
       end
     end
   end
 end
 statistics
end
#player_stats("Reggie Evans")

def big_shoe_rebounds
  rebounds = ""
  def shoe_size
    biggest_shoe = 0
    game_hash.each do |team, team_info|
      team_info.each do |description, data|
        if description == :players
          data.each do |player, stats|
            if biggest_shoe == 0  || stats[:shoe] > biggest_shoe
              biggest_shoe = stats[:shoe]
            end
          end
        end
      end
    end
    biggest_shoe
  end
  game_hash.each do |team, team_info|
    team_info.each do |description, data|
      if description == :players
        data.each do |player, stats|
          if stats[:shoe] === shoe_size
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds 
end


