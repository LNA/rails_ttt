class MoveMaker
  def initialize(game)
    @game = game
  end

  def make_human_move(player_presenter, move)
    if valid_move?(move)
      make_move(player_presenter, move)
    end
  end

  def ai_move(player_presenter) 
    best_move = @game.ai.find_best_move(@game.board, player_presenter.current_player_mark, player_presenter.next_player_mark)
    @game.board.fill(best_move, player_presenter.current_player_mark)
  end
  
private

  def is_second_player?
    @game.board.count(nil).even?
  end

  def valid_move?(move)
    @game.board[move] == nil && move.to_i < 9
  end

  def make_move(player_presenter, move)
    if is_second_player?
      player_presenter.current_player_mark
      @game.board[move] = player_presenter.next_player_mark
    else
      @game.board[move] = player_presenter.current_player_mark
    end
  end
end