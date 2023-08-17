require_relative '../book'
require_relative '../game'
require_relative '../label'
require_relative '../author'
require_relative '../source'
require_relative '../genre'
require_relative '../music_album'

RSpec.describe Book do
  let(:book) { Book.new('2222-12-12', 'publiser1', 'cover-state') }

  describe '#initialize' do
    it 'sets the publisher and cover state correctly' do      
      expect(book.publisher).to eq('publiser1')
      expect(book.cover_state).to eq('cover-state')
    end
  end
end

RSpec.describe Game do
  let(:game) { Game.new('2022-12-12', 'true' , '2023-01-01') }

  describe '#initialize' do
    it 'sets the multiplayer and last played correctly' do      
      expect(game.multiplayer).to eq('true')
      expect(game.last_played).to eq('2023-01-01')
    end
  end
end

RSpec.describe MusicAlbum do
  let(:album) { MusicAlbum.new('2022-12-12', 'true') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(album.on_spotify).to eq('true')      
    end
  end
end

RSpec.describe Label do
  let(:label) { Label.new('label-title', 'black') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(label.title).to eq('label-title')      
      expect(label.color).to eq('black')      
    end
  end
end

RSpec.describe Author do
  let(:author) { Author.new('benjamin', 'mendez') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(author.first_name).to eq('benjamin')      
      expect(author.last_name).to eq('mendez')      
    end
  end
end

RSpec.describe Genre do
  let(:genre) { Genre.new('sci-fi') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(genre.name).to eq('sci-fi')            
    end
  end
end

RSpec.describe Source do
  let(:source) { Source.new('internet') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(source.name).to eq('internet')            
    end
  end
end

RSpec.describe Source do
  let(:source) { Source.new('internet') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(source.id).to be < 1000
    end
  end
end

RSpec.describe Source do
  let(:source) { Source.new('internet') }

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      expect(source.items).to be_empty 
    end
  end
end

RSpec.describe Source do
  let(:source) { Source.new('internet') }
  let(:book) {Book.new('2021-12-12', 'publisher1', 'cover_state1')}

  describe '#initialize' do
    it 'sets the title and author correctly' do      
      items = source.add_item(book)
      expect(items).not_to be_empty 
    end
  end
end

