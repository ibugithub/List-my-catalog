require './item'
require './genre'
require 'pry'

class Book < Item
  attr_accessor :publisher

  def initialize(pub_date, publisher )
    super(pub_date)
    @publisher = publisher
  end

end


def create_book
  pub_date = '2022-12-13'
  publisher = 'publisher1'
  genre = 'adventure'
  
  # genre_obj = Genre.new(genre)
  
  book1 = Book.new(pub_date, publisher)
  
  book1.genre = Genre.new(genre)
  
  p "este es el libro"
  
  p book1
  # binding.pry
end

# create_book










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