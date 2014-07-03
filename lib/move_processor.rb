class MoveProcessor
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  HUMAN = "Human"

  def process(current_player_mark, current_player_type, player_one_mark, player_two_mark, next_player_mark, move)
    current_player_mark = process_current_player(current_player_mark, player_two_mark)
    next_player_mark    = process_next_player(next_player_mark, player_one_mark)
    if current_player_type == HUMAN 
      make_human_move(current_player_mark, move)
    else
      ai_move(current_player_mark, next_player_mark)
    end
  end

private
  def make_human_move(current_player_mark, move)
    @game.board.fill(move, current_player_mark) 
  end

  def process_current_player(current_player_mark, player_two_mark)
    if is_second_player? 
      current_player_mark = player_two_mark
    end
    current_player_mark
  end

  def process_next_player(current_player_mark, player_one_mark)
    if is_second_player? 
      current_player_mark = player_one_mark
    end
    current_player_mark
  end

  def ai_move(current_player_mark, next_player_mark) 
    best_move = @game.ai.find_best_move(@game.board, current_player_mark, next_player_mark)
    @game.board.fill(best_move, current_player_mark)
  end

  def is_second_player?
    @game.board.spaces.count(nil).even?
  end
end