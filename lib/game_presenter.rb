class GamePresenter
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def build_board
    @game.board.spaces.to_s
  end
end