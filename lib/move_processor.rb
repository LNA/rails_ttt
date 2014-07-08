class MoveProcessor
  attr_accessor :move_maker, :game
  def initialize(game, move_maker)
    @game       = game
    @move_maker = move_maker
  end

  HUMAN = "Human"

  def process(board, move, player_presenter)
    current_player_mark = set_current_player_mark(player_presenter)
    next_player_mark    = set_next_player_mark(player_presenter)
    current_player_type = set_current_player_type(player_presenter)
    process_move(board, move, player_presenter, current_player_type)
  end
  
  private

  def set_current_player_mark(player_presenter) 
    if is_second_player? 
      current_player_mark = player_presenter.player_two_mark
    end
    current_player_mark
  end

  def set_next_player_mark(player_presenter) 
    if is_second_player? 
      current_player_mark = player_presenter.player_one_mark
    end
    current_player_mark
  end

  def set_current_player_type(player_presenter)
    if is_second_player?
      current_player_type = player_presenter.player_two_type
    else
      current_player_type = player_presenter.player_one_type 
    end
    current_player_type
  end
  
  def process_move(board, move, player_presenter, current_player_type)
    player_presenter.player_one_type
    player_presenter.player_two_type
    if current_player_type == HUMAN 
      @move_maker.make_human_move(board, move, player_presenter)
    else
      @move_maker.ai_move(player_presenter)
    end
  end

  def is_second_player?
    @game.board.count(nil).even?
  end
end