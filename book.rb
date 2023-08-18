require './item'
require './genre'
# require 'pry'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(pub_date, publisher, cover_state)
    super(pub_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

# puts " publish date ?"
# date = gets.chomp
# puts 'publisher?'
# publisher = gets.chomp
# puts 'author first name?'
# author = gets.chomp
# puts 'author last name?'
# author = gets.chomp
# puts 'genre?'
# genre = gets.chomp
# puts 'source?'
# source = gets.chomp
# puts 'label?'
# label = gets.chomp
# puts 'author last name?'
# author = gets.chomp
