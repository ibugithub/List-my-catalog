require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(pub_date, on_spotify, archived: false)
    super(pub_date, archived: archived)
    @on_spotify = on_spotify
  end
end
