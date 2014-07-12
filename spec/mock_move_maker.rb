class MockMoveMaker
  attr_accessor :made_ai_move
                :made_human_move

  def iniaialize
    @game = "game"
  end

  def make_human_move(board, current_player_mark, move)
    @make_human_move = true
  end 

  def ai_move(player_presenter)
    @made_ai_move = true
  end
end