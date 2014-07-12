class MovePresenter
  attr_accessor :game, :move_processor

  def self.present_move(game, move, player_presenter) 
    move_processor(game).process(game.board, move, player_presenter)
  end

private

  def self.move_processor(game)
    MoveProcessor.new(game, MoveMaker.new(game))
  end

   def self.move_maker(game)
    MoveMaker.new(@game)
  end
end