class GamePresenter
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def build_board
    @game.board.spaces.to_s
  end

  def build_current_player
    @game.settings.current_player.mark.to_s
  end
end
