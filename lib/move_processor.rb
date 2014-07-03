class MoveProcessor
  attr_accessor :game, :adapter

  def initialize(game, adapter)
    @game    = game
    @adapter = adapter
  end

  def process(current_player_mark, current_player_type, player_one_mark, player_two_mark, next_player_mark, move)
    current_player_mark = @adapter.process_current_player(current_player_mark, player_two_mark)
    next_player_mark    = @adapter.process_next_player(next_player_mark, player_one_mark)
    @adapter.process_move(current_player_mark, current_player_type, next_player_mark, move)
  end
end