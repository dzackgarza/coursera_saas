# Part 2
class WrongNumberOfPlayersError < StandardError ; end
# Raised when strategy is not 'R', 'P', or 'S'
class NoSuchStrategyError < StandardError ; end

# Given a two element list, return the name and strategy of the winning player.
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  p1strat = game[0][1].downcase
  p2strat = game[1][1].downcase
  
  raise NoSuchStrategyError unless ["r", "p", "s"].include?(p1strat) or ["r", "p", "s"].include?(p2strat)
  # So many comparisons! #TODO There must be a better way.
  if p1strat == "r" && p2strat == "p" or p1strat == "p" && p2strat == "s" or p1strat == "s" && p2strat == "r"
    puts "#{game[1][0]} wins against #{game[0][0]}."
    return game[1]
  else
    puts "#{game[0][0]} wins against #{game[1][0]}."
    return game[0]
  end
end

def rps_tournament_winner(tournament)
  if tournament[0][0].length == 2
    return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
  else
    return rps_game_winner([tournament[0], tournament[1]])
  end
end

tournament = [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

#winner = rps_tournament_winner(tournament)
#puts "#{winner[0]} wins the tournament with #{winner[1]}"
