class MockMoveProcessor
  attr_accessor :processed_move

  def process(board, move, player_presenter)
    @processed_move = true 
  end
end