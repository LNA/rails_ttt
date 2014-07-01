class UpdateAdapter
  attr_accessor :params, :game_rules, :board

  def initialize(listner, game_rules, board)
    @listner = listner
    @game_rules = game_rules
    @board = board
  end

  def check_for_winner(params)
    if @game_rules.game_over?(@board.spaces)
      @listner.render_game_over
    else
      @listner.update_game(params)
    end
  end
end