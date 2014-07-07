class BoardWrapper

  def initialize(game)
    @game = game
  end

  def convert_board_to_string
    @game.board.to_s
  end
end