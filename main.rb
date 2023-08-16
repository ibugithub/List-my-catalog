require './app'

class Options
  def initialize
    puts "welcome to my app"
    @app = App.new(self)     
    show_menu
  end

  def show_menu
    puts "============================"
    puts "select the option you want"
    puts "============================"
    puts "1- List all books"
    puts "2- List all music albums"
    puts "3- List all movies"    
    puts "4- List all games"
    puts "5- List all genres"    
    puts "6- List all labels"    
    puts "7- List all authors"    
    puts "8- List all sources"    
    puts "9- Add a book"    
    puts "10- Add a music album"    
    puts "11- Add  a movie"    
    puts "12- Add  a game"    
    puts "13- exit"    
    option = gets.chomp.to_i 
    send_option(option)
  end

  def send_option(option)
    options = {
      1 => :List_all_books,
      2 => :list_all_music_albums,
      3 => :list_all_movies,
      4 => :list_all_games,
      5 => :list_all_genres,
      6 => :list_all_labels,
      7 => :list_all_authors,
      8 => :list_all_sources,
      9 => :add_book,
      10 => :add_music_album,
      11 => :add_movie,
      12 => :add_game,
      13 => :exit
    }
    method = options[option]   
    @app.send(method)
  end
  



end

def menu
  Options.new
end

menu
