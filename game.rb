require './item'

class Game < Item
  attr_accessor :pub_date, :multiplayer, :last_played

  def initialize(pub_date, multiplayer, last_played)
    super(pub_date)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  def can_be_archived?
    super && (Time.now - @last_played) > 2 * 365 * 24 * 60 * 60
  end
end
