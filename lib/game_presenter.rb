class GamePresenter
  attr_accessor :game
  
  def initialize(game)
    @game = game
  end

  def parse_settings(game)
    game.settings.to_json
  end

  def parse_board(game)
    game.board.spaces.to_json
  end
end
