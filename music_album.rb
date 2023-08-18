require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(pub_date, on_spotify)
    super(pub_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
