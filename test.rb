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
   genre = ele['genre']
   f_name = ele['first_name']
   l_name = ele['last_name']
   source = ele['source']
   label = ele['label']
   label_color = ele['label_color']
   on_spotify = ele['on_spotify']
   multiplayer = ele['multiplayer']
   last_played = ele['last_played']
   publisher = ele['publisher']
   cover_state = ele['cover_state']
    
    if ele['type'] == "Music_album"
      new_item = Music_album.new( pub_date , on_spotify)          
    elsif ele['type'] == "Game"
      new_item = Game.new( pub_date , multiplayer, last_played) 
   elsif ele['type'] == "Book"
      new_item = Book.new( pub_date , publisher, cover_state)
    end
    
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
  
    final_data << new_item
  end    

  final_data        

end 