# Coursera SAAS, Homework 1

# Part 1, a)
# Given a string, return whether or not it is a palindrome.
def palindrome?(string)
  string = string.downcase.gsub!(/\W/, "")
  string.reverse == string
end

# Part 1, b)
# Given a string, return a hash containing the value of each word with a key 
# representing the number of times it appears in the string.
def count_words(string)
  hash = {}
  words = string.downcase.split(/\b\W+\b/)
  words.each do |word| 
    hash[word] = string.downcase.scan(/\b#{word}\b/).size
  end
  return hash
end

# Part 2
class WrongNumberOfPlayersError < StandardError ; end
# Raised when strategy is not 'R', 'P', or 'S'
class NoSuchStrategyError < StandardError ; end

# Given a two element list, return the name and strategy of the winning player.
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  p1strat = game[0][1].downcase
  p2strat = game[1][1].downcase
  raise NoSuchStrategyError unless p1strat == ("r" or "p" or "s") or p2strat == ("r" or "p" or "s")

  if p1strat == "r" && p2strat == "p" or p1strat == "p" && p2strat == "s" or p1strat == "s" && p2strat == "r"
    return game[1]
  else
    return game[0]
  end
end

list = [ ["Bob", "R"], ["Joe", "P"] ]
puts rps_game_winner(list)

