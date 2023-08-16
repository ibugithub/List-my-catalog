require './item'

class Game < Item
  attr_accessor :pub_date, :multiplayer, :last_played

  def initialize(pub_date, multiplayer, last_played )
    super(pub_date)
    @multiplayer = multiplayer
    @last_played = last_played
  end
end