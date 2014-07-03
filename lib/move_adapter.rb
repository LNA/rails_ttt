class MoveAdapter
  attr_accessor :game, :move_maker

  def initialize(game, move_maker)
    @game = game
    @move_maker = move_maker
  end

  HUMAN = "Human"

  def process_current_player(current_player_mark, player_two_mark) #duplication to be explicit?
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
  
  def process_move(current_player_mark, current_player_type, next_player_mark, move)
    if current_player_type == HUMAN 
      @move_maker.make_human_move(current_player_mark, move)
    else
      @move_maker.ai_move(current_player_mark, next_player_mark)
    end
  end

  def is_second_player?
    @game.board.spaces.count(nil).even?
  end
end