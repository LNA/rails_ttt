class MoveMaker
  def initialize(game)
    @game = game
  end

 def make_human_move(current_player_mark, move)
    @game.board.fill(move, current_player_mark) 
  end

  def ai_move(current_player_mark, next_player_mark) 
    best_move = @game.ai.find_best_move(@game.board, current_player_mark, next_player_mark)
    @game.board.fill(best_move, current_player_mark)
  end
end