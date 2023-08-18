require 'json'

class Associate
  attr_accessor :genres, :sources, :labels, :authors


  def initialize
    @genres = []
    @sources = []
    @authors = []
    @labels = []
    p 'starting asssociate'
  end

  def associate_item(item, gen_info)
    p 'starting asscoiate item'
    _, genre, f_name, l_name, source, label, label_color = gen_info
    genre_obj = Genre.new(genre)
    p 'adding genres'
    @genres << genre_obj

    item.genre = genre_obj

    author_obj = Author.new(f_name, l_name)
    @authors << author_obj
    item.author = author_obj

    source_obj = Source.new(source)
    @sources << source_obj
    item.source = source_obj

    label_obj = Label.new(label, label_color)
    @labels << label_obj
    item.label = label_obj
    item
  end

  def extract(data)
    final_data = []
    data.each do |ele|
      ele['type']
      ele['pub_date']
      ele['archived']
      genre = ele['genre']
      f_name = ele['first_name']
      l_name = ele['last_name']
      source = ele['source']
      label = ele['label']
      label_color = ele['label_color']
      # ele['on_spotify']
      # ele['multiplayer']
      # ele['last_played']
      # ele['publisher']
      # ele['cover_state']

      new_item = create_item_type(ele)

      type_data = new_item, genre, f_name, l_name, source, label, label_color

      final_data << add_associate(type_data)
    end

    final_data
  end

  def create_item_type(element)
    type = element['type']
    pub_date = element['pub_date']
    on_spotify = element['on_spotify']
    multiplayer = element['multiplayer']
    last_played = element['last_played']
    publisher = element['publisher']
    cover_state = element['cover_state']


    case type
    when 'MusicAlbum'
      new_item = MusicAlbum.new(pub_date, on_spotify)
    when 'Game'
      new_item = Game.new(pub_date, multiplayer, last_played)
    when 'Book'
      new_item = Book.new(pub_date, publisher, cover_state)
    end
    new_item
  end

  def add_associate(data)
    new_item, genre, f_name, l_name, source, label, label_color = data

    author_obj = Author.new(f_name, l_name)
    @authors << author_obj
    new_item.author = author_obj

    genre_obj = Genre.new(genre)
    @genres << genre_obj
    new_item.genre = genre_obj


    source_obj = Source.new(source)
    @sources << source_obj
    new_item.source = source_obj
    label_obj = Label.new(label, label_color)
    @labels << label_obj
    new_item.label = label_obj
    new_item
  end

  def load_from_file(file_name)
    begin
      data = JSON.parse(File.read(file_name))
    rescue StandardError
      data = []
    end
    extract(data)
  end
end
