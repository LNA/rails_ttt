class MoveProcessor
  attr_accessor :game, :params

  def initialize(params, game)
    @params = params 
    @game = game
  end

  HUMAN = "Human"

  def process
    if params[:current_player_type] == HUMAN 
      make_human_move 
    else
      process_order_of_players
      ai_move
    end
  end

private
  def make_human_move
    @game.board.fill(params[:square].to_i, params[:current_player_mark]) 
  end

  def process_order_of_players
    if ai_is_second_player? 
      params[:current_player_mark] = params[:player_two_mark]
    end
  end

  def ai_move 
    best_move = @game.ai.find_best_move(@game.board, params[:current_player_mark], params[:next_player_mark])
    @game.board.fill(best_move,params[:current_player_mark])
  end

  def ai_is_second_player?
    @game.board.spaces.count(nil).even?
  end
end