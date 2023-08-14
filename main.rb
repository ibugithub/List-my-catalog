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
    puts "1- create book"
    puts "2- create Music album"
    puts "3- create Movie"
    puts "4- create game"
    puts "5- show all books"
    puts "6- show all movies"
    puts "7- show all games"
    puts "8- exit"    
    option = gets.chomp.to_i 
    send_option(option)
  end

  def send_option(option)
    options = {
      1 => :create_book,
      2 => :create_book,
      3 => :create_book,
      4 => :create_book,
      5 => :create_book,
      6 => :get_info
    }
    method = options[option]        
    @app.send(method)
  end

  def self.get_info
    puts "author of the book"
    author = gets.chomp
    puts "genre of the book"
    genre = gets.chomp
    puts "author of the book"
    author = gets.chomp
  end



end

def menu
  Options.new
end

menu
