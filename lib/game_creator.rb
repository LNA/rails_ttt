class GameCreator # Make more functional 
  attr_accessor :game, :players

  def initialize(game)
    @game = game 
  end

  def create
    create_players
  end

  def create_players
    @game.players.create
  end
end