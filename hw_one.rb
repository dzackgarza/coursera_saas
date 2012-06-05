# Coursera SAAS, Homework 1

# Part 1, a)
# Given a string, return whether or not it is a palindrome.
def palindrome?(string)
  string = string.downcase.gsub!(/\W/, "")
  string.reverse == string #Note to self - returns the evaluation of this condition.
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


class String
  def sort
    self.split(//).sort.join
  end
end


def combine_anagrams(words)

  output_list = []
  
  words.each_with_index do |word, i|
    temp_output_list = []
    temp_output_list.push(word)
    
    (i+1).upto(words.length-1) { |j|
      if words[j].is_a?(String) && word.downcase.sort == words[j].downcase.sort
        temp_output_list.push(words[j])
        words.delete(words[j])
      end
    }
    output_list.push(temp_output_list)
  end
  return output_list
end

#anagram = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
#puts combine_anagrams(anagram)

class Desserts
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  attr_accessor :name, :calories
  
  def healthy?
    if self.calories < 200 
      return true
    else
      return false
    end
  end
  
  def delicious?
    return true
  end
end

class Jellybean < Desserts
  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor  
  end
  attr_accessor :flavor
  def delicious?
    if self.flavor == "black licorice"
      return false
    else 
      return true
    end
  end
end

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(attr_name)
        @attr_name = attr_name
        
        if @#{attr_name}_history != nil
          @#{attr_name}_history.push(attr_name)
        else
          @#{attr_name}_history = Array.new
          @#{attr_name}_history.push(nil)
          @#{attr_name}_history.push(attr_name)
        end  
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end

#f = Foo.new
#f.bar = 1
#f.bar = 2
#f.bar_history # => if your code works, should be [nil,1,2]

class Numeric
  @@currencies = {'dollar' => 1.000, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 
  def in(currency_to_change_to)
    singular_currency = currency_to_change_to.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
  
  def method_missing(method_id)
    base_singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(base_singular_currency)
      self * @@currencies[base_singular_currency]
    else
      super
    end
  end
end
#puts 1.dollar.in(:yen)

class String
  def palindrome?()
    string = self.downcase.gsub(/\W/, "")
    string.reverse == string  
  end
end
#puts "A man, a plan, a canal -- Panamas".palindrome?

module Enumerable
  def palindrome?()
    self == self.reverse
  end
end
#puts [1,2,3,2,1].palindrome?

class CartesianProduct
  include Enumerable
    def initialize(set_one, set_two)
      @set_one = set_one
      @set_two = set_two
    end
    
    def each
     @set_one.each do |i|
        @set_two.each do |j|
          yield [i,j]
        end
      end
    end
end

#c = CartesianProduct.new([:a,:b], [4,5])
#c.each { |elt| puts elt.inspect }
#  =>
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

#c = CartesianProduct.new([:a,:b], [])
#c.each { |elt| puts elt.inspect }
# =>
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)
