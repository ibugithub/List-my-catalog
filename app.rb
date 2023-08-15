class App

  def initialize(options)
    @options = options
    @music_albums = []    
    @genres = []
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
    puts "author of the music album?"
    author = gets.chomp
    puts "genre of the music album?"
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

  def show_music_albums 
    return puts "no hay albunes" if @music_albums.empty?

    # add code when there are albums

    @options.show_menu
  end

  def show_all_genres
    return puts "there is no genres yet" if @genres.empty?

    #add extra code

    @options.show_menu
  end

  def exit
    puts "thanks for using this app!"
  end

end