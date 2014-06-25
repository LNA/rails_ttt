class GamePresenter
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def build_board_from(game)
    game.spaces.to_s
  end
end