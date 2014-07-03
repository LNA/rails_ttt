class MockMoveMaker
  attr_accessor :made_ai_move
                :made_human_move

  def iniaialize
    @game = "game"
  end

  def make_human_move(current_player_mark, move)
    @make_human_move = true
  end

  def ai_move
    @made_ai_move
  end
end