class MockGame
  attr_accessor :ai, 
                :board,
                :game_rules, 
                :player_one, :player_two

  def initialize(ai, board, game_rules, player_one)
    @ai         = ai
    @board      = board
    @game_rules = game_rules
    @player_one = player_one
    @player_two = player_two
  end
end