class UpdateAdapter
  attr_accessor  :board, :game,
                 :game_rules, :params

  def initialize(listner, game)
    @listner = listner
    @game    = game
  end

  def check_for_winner(params)
    if @game.game_rules.game_over?(@game.board.spaces)
      @listner.render_game_over
    else
      @listner.update_game(params)
    end
  end
end