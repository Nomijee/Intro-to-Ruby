# When done, submit this entire file to the autograder.
# Muhammad Noman Junaid
# G00351754
# Software Engineering 
# Introduction to Ruby

# Part 1

def sum arr
  # YOUR CODE HERE
  if (arr.empty? || arr.nil?)
    return 0
  else 
    arr.reduce(:+)
  end
end

def max_2_sum arr
  # YOUR CODE HERE
  if (arr.empty? || arr.nil?)
    return 0
  else 
    arr.sort! { |a,b| b <=> a}
    arr[0,2].reduce(:+)
  end
end

def sum_to_n? arr, n
  # YOUR CODE HERE
    if (arr.empty? || arr.nil?) 
    return 0 == false
   else 
    arr.combination(2).any? { |a,b| (a+b) == n} 
  end
end

# Part 2
#Define a method hello(name) that takes a string representing a name 
#and returns the string "Hello, " concatenated with the name.

def hello(name)
  # YOUR CODE HERE
    "Hello, " + name
end


#Define a method starts_with_consonant?(s) that takes a string 
#and returns true if it starts with a consonant and false otherwise.
# (For our purposes, a consonant is any letter other than A, E, I, O, U.) 
# NOTE: be sure it works for both upper and lower case and for nonletters!

def starts_with_consonant? s
  # YOUR CODE HERE
  # psj :: !! it's easier to evaluate an array of vowels using #includes? than understand your regular expression
  # vh: agreed but was not passing test on special characters ex. /&%$# 
  # this expression works too (s =~ /^(?=[^aeiou])(?=a-z)/i )==0
  # you had it something like this: , so we can add
  # BP : What I noticed on this is that the original way it was written,
  # any tests with numbers or special characters were returning true. ..and emptys and ints threw errors.
  # the other option could be to just test the consonants instead of vowels.. but that isn't very elegent 
  
  vowels = %w(a e i o u)
  consonant =("a".."z").find_all {|letter| !vowels.include? letter}
if (s.is_a?(String) && !s.empty?)
  return consonant.include? s[0].downcase
else 
  return false
end
end


#Define a method binary_multiple_of_4?(s) that takes a string 
# and returns true if the string represents a binary number that is a multiple of 4.
# NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4? s
  # YOUR CODE HERE
  if (s.empty? || s.nil?) 
    return 0 == false
  else 
    test = s.is_a?(String) && s.match(/^[0-1]+$/)!= nil && s.to_i(2) % 4 == 0 
  end 
end

# Part 3

class BookInStock
# YOUR CODE HERE
  #Define a class BookInStock which represents a book with an ISBN number,
  #isbn, and price of the book as a floating-point number, price, as attributes
  attr_accessor :isbn, :price
  def initialize(isbn,price)
    #setters
    @isbn=isbn
    @price=price
  #The constructor should accept the ISBN number 
  #(a string, since in real life ISBN numbers can begin with zero and can include hyphens)
  # as the first argument and price as second argument, 
  # and should raise ArgumentError (one of Ruby’s built-in exception types)
  #  if the ISBN number is the empty string or if the price is less than or equal to zero. 
  #  Include the proper getters and setters for these attributes  
  
    raise ArgumentError.new ("ISBN is an empty string") if isbn.empty? 
    raise ArgumentError.new ("Price is less than or equals to 0") if (price <= 0)
end
  
  #Include a method price_as_string that returns the price of 
  #the book formatted with a leading dollar sign and two decimal places, 
  #that is, a price of 20 should format as $20.00 and a price of 33.8 should
  # format as $33.80
  
  def price_as_string
    "$#{"%0.2f" % @price}"
  end  
  
end
