class ProcessMove
  attr_accessor :game, :params

  def initialize(params, game)
    @params = params 
    @game = game
  end

  HUMAN = "Human"

  def process
    if params[:current_player_type] == HUMAN 
      @game.board.fill(params[:square].to_i, params[:current_player_mark]) 
    else
      ai_move
    end
  end

  def ai_move #should return move.  Doing too much.
    if @board.spaces.count(nil).even? #wrap in board, exposes too much information.  This object shouldn't know about boards details
      params[:current_player_mark] = params[:player_two_mark]
    end
    best_move = @ai.find_best_move(@board, params[:current_player_mark], params[:next_player_mark])
    @board.fill(best_move,params[:current_player_mark])
  end
end