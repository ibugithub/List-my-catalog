require './musicAlbum'
require './genre'
require './source'
require './author'
require './label'
require 'json'

class App

  def initialize(options)
    @options = options
    @music_albums = []    
    @genres = []
    @sources = []
    @author = []
    @labels = []
  end

  def add_music_album
    array_gen_info = collect_gen_info('music album')
    #it returns [pub_date, genre, f_name, l_name, source, label, label_color]
    pub_date, genre, f_name, l_name, source, label, label_color = array_gen_info
    puts "is it on spotify (y) or (n)?"
    on_spotify = gets.chomp  == 'y' ? true : false

    # new_album = Music_album.new(pub_date, on_spotify)
    new_album = Music_album.new( '2022-12-12' , on_spotify)
    new_album.genre = Genre.new(genre)
    new_album.author = Author.new(f_name, l_name)
    new_album.source = Source.new(source)
    new_album.label = Label.new(label, label_color)

    @music_albums << new_album

    puts "Album creates sucessfully"

    save_on_json(@music_albums)

    @options.show_menu
  end

  def collect_gen_info(item)
    puts "insert the publish date, use this format : yyyy-mm-dd"
    pub_date = gets.chomp 

    puts "genre of the #{item}?"
    genre = gets.chomp

    puts "first name of the author?"
    first_name_author = gets.chomp

    puts "last name of the author?"
    last_name_author = gets.chomp
    
    puts "source of the #{item}?"
    source = gets.chomp

    puts "label of the #{item}?"
    label = gets.chomp

    puts "label color of the #{item}?"
    label_color = gets.chomp
    
    return [pub_date, genre, first_name_author, last_name_author, source, label, label_color]
  end

  def save_on_json(array)
     final_data = []
     array.each do |ele|

      data = {
        'type' => ele.class.name,
        'id' => ele.id,
        'pub_date' => ele.pub_date,
        'archived' => ele.archived,
        'on_spotify' => ele.on_spotify,
        'genre' => ele.genre.name,
        'first_name' => ele.author.first_name,
        'last_name' => ele.author.last_name,
        'source' => ele.source.name,
        'label' => ele.label.title,
        'label_color' => ele.label.color 
      }

      final_data << data      
      p ele        
    end 

    File.write('music_albmus.json', JSON.generate(final_data)  )



  end


  def create_book
    puts "insert the publish date, use this format : yyyy-mm-dd"
    pub_date = gets.chomp
    puts "genre of the book"
    genre = gets.chomp    
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