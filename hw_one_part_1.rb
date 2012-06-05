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