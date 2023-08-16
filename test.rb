require 'json'
require './musicAlbum'
require './genre'
require './source'
require './author'
require './label'

file_name = 'music_album.json'

@music_albums = []

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
   new_album.genre = Genre.new(genre)
   new_album.author = Author.new(f_name, l_name)
   new_album.source = Source.new(source)
   new_album.label = Label.new(label, label_color)

  final_data << new_album
  end
  
   @music_albums << final_data

  
end

load_from_file(file_name)
p @music_albums

