class MovePresenter
  attr_accessor :game, :move_processor

  def self.move_maker(game)
    MoveMaker.new(@game)
  end

  def self.move_processor(game)
    MoveProcessor.new(game, MoveMaker.new(game))
  end

  def self.present_move(game, player_presenter, move) 
    move_processor(game).process(player_presenter, move)
  end
end