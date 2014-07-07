class MoveProcessor
  attr_accessor :move_maker, :game
  def initialize(game, move_maker)
    @game       = game
    @move_maker = move_maker
  end

  HUMAN = "Human"

  def process(player_presenter, move)
    current_player_mark = set_current_player_mark(player_presenter)
    next_player_mark    = set_next_player_mark(player_presenter)
    process_move(player_presenter, move)
  end
  
  private

  def set_current_player_mark(player_presenter) #duplication to be explicit?
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
  
  def process_move(player_presenter, move)
    if player_presenter.current_player_type == HUMAN 
      @move_maker.make_human_move(player_presenter, move)
    else
      @move_maker.ai_move(player_presenter)
    end
  end

  def is_second_player?
    @game.board.count(nil).even?
  end
end