import './item.rb'


class Music_album < Item
  def initialize(pub_date, archived: false, on_spotify: false  )
    super(pub_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    
  end
  


end