require './musicAlbum'
require './game'
require './genre'
require './source'
require './author'
require './label'
require 'json'

class App

  @@genres = []
  @@sources = []
  @@authors = []
  @@labels = []

  def initialize(options)
    @options = options
    @music_albums = load_from_file('music_album.json')        
    @games = []
  end

  def add_music_album
    array_gen_info = collect_gen_info('music album')
    #it returns [pub_date, genre, f_name, l_name, source, label, label_color]
    pub_date, genre, f_name, l_name, source, label, label_color = array_gen_info
    # pub_date, genre, f_name, l_name, source, label, label_color = collect_gen_info('music album')
    puts "is it on spotify (y) or (n)?"
    on_spotify = gets.chomp  == 'y' ? true : false

    # new_album = Music_album.new(pub_date, on_spotify)
    new_album = Music_album.new( '2022-12-12' , on_spotify)

    genre_obj = Genre.new(genre)
    @@genres << genre_obj
    new_album.genre = genre_obj

    author_obj = Author.new(f_name, l_name)
    @@authors << author_obj
    new_album.author = author_obj
    
    source_obj = Source.new(source)
    @@sources << source_obj
    new_album.source = source_obj
    
    label_obj = Label.new(label, label_color)
    @@labels << label_obj
    new_album.label = label_obj

    @music_albums << new_album

    puts "Album created sucessfully"

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
        'genre' => ele.genre.name,
        'first_name' => ele.author.first_name,
        'last_name' => ele.author.last_name,
        'source' => ele.source.name,
        'label' => ele.label.title,
        'label_color' => ele.label.color         
        
      }

      if ele.class.name == "Music_album"
        data['on_spotify'] = ele.on_spotify
      elsif ele.class.name == "Game"
        data['multiplayer'] = ele.multiplayer
        data['last_played'] = ele.last_played
      end

      final_data << data      
      
      # p ele.class.name        
    end 

    
      File.write("#{array[0].class.name}.json", JSON.generate(final_data)  )
    

    


  end

  def load_from_file(file_name)
    begin
      data = JSON.parse(File.read(file_name))
    rescue => exception
      data = []
    end

    final_data = []

    data.each do |ele|      

     type = ele['type']
     id = ele['id']
     pub_date = ele['pub_date']
     archived = ele['archived']
     on_spotify = ele['on_spotify']
     genre = ele['genre']
     f_name = ele['first_name']
     l_name = ele['last_name']
     source = ele['source']
     label = ele['label']
     label_color = ele['label_color']
  
     new_album = Music_album.new( pub_date , on_spotify)     
     
     genre_obj = Genre.new(genre)
     @@genres << genre_obj
     new_album.genre = genre_obj
 
     author_obj = Author.new(f_name, l_name)
     @@authors << author_obj
     new_album.author = author_obj
     
     source_obj = Source.new(source)
     @@sources << source_obj
     new_album.source = source_obj
     
     label_obj = Label.new(label, label_color)
     @@labels << label_obj
     new_album.label = label_obj      
    
    final_data << new_album
    end    

    final_data        

  end    

  def add_game
    gen_info = collect_gen_info('game')
    pub_date, genre, f_name, l_name, source, label, label_color = gen_info

    puts "is the game multiplayer? (y) or (n)? "
    multiplayer = gets.chomp
    puts "last played date? format: yyyy-mm--dd"
    date = gets.chomp

    new_item = Game.new('2022-10-13', multiplayer, date)

    genre_obj = Genre.new(genre)
    @@genres << genre_obj
    new_item.genre = genre_obj

    author_obj = Author.new(f_name, l_name)
    @@authors << author_obj
    new_item.author = author_obj
    
    source_obj = Source.new(source)
    @@sources << source_obj
    new_item.source = source_obj
    
    label_obj = Label.new(label, label_color)
    @@labels << label_obj
    new_item.label = label_obj

    @games << new_item

    save_on_json(@games)
    puts "game sucessfullly created"

    @options.show_menu
    
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts "albums is empty"      
    else  
      @music_albums.each do |ele|
        p ele
      end
    end

    @options.show_menu
  end

  def list_all_games
    if @games.empty? 
      puts "there is no games"
      @options.show_menu
    else
      @games.each do |ele|
        p ele
      end
    end
  end

  def list_all_genres
    if @@genres.empty?
      puts "there is no genders"      
    else 
      @@genres.each do |ele|
        p ele
      end
    end
    @options.show_menu
  end

  def list_all_labels
    if @@labels.empty?
      puts "there is no labels"      
    else 
      @@labels.each do |ele|
        p ele
      end
    end
    @options.show_menu
  end

  def list_all_authors
    if @@authors.empty?
      puts "there is no authors"      
    else 
      @@authors.each do |ele|
        p ele
      end
    end
    @options.show_menu
  end

  def list_all_sources
    if @@sources.empty?
      puts "there is no sources"      
    else 
      @@sources.each do |ele|
        p ele
      end
    end
    @options.show_menu
  end

  def exit
    puts "thanks for using this app!"
  end

end