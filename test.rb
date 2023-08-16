require 'json'
# require './musicAlbum'
# require './genre'
# require './source'
# require './author'
# require './label'
require './book'

new_data = {
  'pub_date':  '2022-12-12',
  'publisher':  'publisher2',
  'cover_state':  'cover-2',
  'first_name': 'benja',
  'last_name': 'mendez',
}

def load_file(fileName)  
  begin
    JSON.parse(File.read(fileName)    )
  rescue 
    []
  end
end

def add_book(filename, new_data)
  prev_data = load_file(filename)
  prev_data << new_data
  File.write('books.json', JSON.generate(prev_data))
end

add_book('books.json', new_data)


