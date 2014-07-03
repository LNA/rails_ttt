class MovePresenter
  attr_accessor :game, :move_processor

  def self.move_maker(game)
    MoveMaker.new(@game)
  end

  def self.adapter(game)
    MoveAdapter.new(game, move_maker)
  end

  def self.move_processor(game)
    MoveProcessor.new(game, MoveAdapter.new(game, MoveMaker.new(game)))
  end

  def self.present_move(game, current_player_mark, current_player_type, player_one_mark, player_two_mark, next_player_mark, move)  
    move_processor(game).process(current_player_mark, current_player_type, player_one_mark, player_two_mark, next_player_mark, move)
  end
end