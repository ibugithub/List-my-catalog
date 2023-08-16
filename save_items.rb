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
      elsif ele.class.name == "Book"
        data['publisher'] = ele.publisher
        data['cover_state'] = ele.cover_state
      end
      p 'the data is ', data
      final_data << data      
    end 
      File.write("#{array[0].class.name}.json", JSON.generate(final_data)  )
end