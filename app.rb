class App

  def initialize(options)
    @options = options
  end

  def create_book
    puts "author of the book"
    author = gets.chomp
    puts "genre of the book"
    genre = gets.chomp    
    puts 'book sucessfully created'
    @options.show_menu
  end

  def create_music_album
    puts "author of the music album"
    author = gets.chomp
    puts "genre of the book"
    genre = gets.chomp
    puts "author of the book"
    author = gets.chomp
    puts 'book sucessfully created'
    @options.show_menu
  end

  def create_movie
    puts "author of the book"
    author = gets.chomp
    puts "genre of the book"
    genre = gets.chomp    
    puts 'book sucessfully created'
    @options.show_menu
  end

  def create_game
    puts "author of the book"
    author = gets.chomp
    puts "genre of the book"
    genre = gets.chomp
    puts "author of the book"
    author = gets.chomp
    @options.show_menu
    puts 'book sucessfully created'
  end




end