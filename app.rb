require './music_album'
require './game'
require './genre'
require './source'
require './author'
require './label'
require 'json'
require './book'
require './lib/save_items'
require './lib/associate'
require './lib/collect_gen'

class App
  def initialize(options)
    @options = options
    @associate = Associate.new
    # p 'teh associate is ', @associate
    @collect = Collect.new
    @music_albums = @associate.load_from_file('MusicAlbum.json')
    @games = @associate.load_from_file('Game.json')
    @books = @associate.load_from_file('Book.json')
    @save = Save.new
    @genres = @associate.genres
    @authors = @associate.authors
    @sources = @associate.sources
    @labels = @associate.labels
  end

  def add_music_album
    gen_info = @collect.collect_gen_info('music album')
    puts 'is it on spotify (y) or (n)?'
    on_spotify = gets.chomp == 'y'
    new_album = MusicAlbum.new('2022-12-12', on_spotify)

    albuum_data = @associate.associate_item(gen_info[0], gen_info)
    @music_albums << albuum_data

    puts 'Album created sucessfully'
    @save.save_on_json(@music_albums)
    @options.show_menu
  end

  def add_game
    gen_info = @collect.collect_gen_info('game')
    puts 'is the game multiplayer? (y) or (n)? '
    multiplayer = gets.chomp
    puts 'last played date? format: yyyy-mm--dd'
    date = gets.chomp
    new_item = Game.new('2022-10-13', multiplayer, date)

    game_data = @associate.associate_item(new_item, gen_info)
    @games << game_data
    @save.save_on_json(@games)
    puts 'game sucessfullly created'
    @options.show_menu
  end

  def add_book
    gen_info = @collect.collect_gen_info('book')
    pub_date = gen_info[0]
    puts 'Write the name of the publisher:  '
    publisher = gets.chomp
    puts 'what will be the cover state for this book: '
    cover_state = gets.chomp
    book = Book.new(pub_date, publisher, cover_state)

    book_data = @associate.associate_item(book, gen_info)
    @books << book_data

    @save.save_on_json(@books)
    puts 'books sucessfullly created'
    @options.show_menu
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'albums is empty'
    else
      puts '=============== Music_Albums =============='
      @music_albums.each do |ele|
        # p ele
        puts "->id) #{ele.id} ->pub-date: #{ele.pub_date} ->label) #{ele.label.title} Author)
        #{ele.author.first_name} #{ele.author.first_name} ->On spotify: #{ele.on_spotify}"
      end
    end

    @options.show_menu
  end

  def list_all_games
    if @games.empty?
      puts 'there is no games'
      @options.show_menu
    else
      puts '=============== Games =============='
      @games.each do |ele|
        puts "->id) #{ele.id} ->pub-date: #{ele.pub_date} ->label) #{ele.label.title} Author)
        #{ele.author.first_name} #{ele.author.first_name} Multiplayer-> #{ele.multiplayer} Last_played->
        #{ele.last_played}"
      end
    end
    @options.show_menu
  end

  def list_all_genres
    if @genres.empty?
      puts 'there is no genders'
    else
      @genres.each do |ele|
        puts '------------Genre----------------'
        print 'Title: ', ele.name
        puts
      end
    end
    @options.show_menu
  end

  def list_all_labels
    if @labels.empty?
      puts 'there is no labels'
    else
      @labels.each do |ele|
        puts '------------Labels----------------'
        print 'Title: ', ele.title
        puts
        print 'Color: ', ele.color
        puts
        puts '-------------Labels-----------------'
      end
    end
    @options.show_menu
  end

  def list_all_authors
    if @authors.empty?
      puts 'there is no authors'
    else
      @authors.each do |ele|
        puts '------------Author----------------'
        print 'Author: ', ele.first_name
        puts
        puts '-------------Genre-----------------'
      end
    end
    @options.show_menu
  end

  def list_all_sources
    if @sources.empty?
      puts 'there is no sources'
    else
      @sources.each do |ele|
        puts '------------Source----------------'
        print 'Source: ', ele.name
        puts
        puts '-------------Source-----------------'
      end
    end
    @options.show_menu
  end

  def list_all_books
    if @books.empty?
      puts 'books is empty'
    else
      @books.each do |ele|
        puts '------------Books----------------'
        print 'Label: ', ele.label.title
        puts
        print 'Author: ', ele.author.first_name
        puts
        print 'Publisher : ', ele.publisher
        puts
        print 'Genere :', ele.genre.name
        puts
        print 'Publication Date :', ele.pub_date
        puts
      end
    end

    @options.show_menu
  end

  def exit
    puts 'thanks for using this app!'
  end
end
