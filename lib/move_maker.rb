class MoveMaker
  def initialize(game)
    @game = game
  end

  def make_human_move(board, move, player_presenter)
    if valid_move?(board, move)
      make_move(player_presenter, move)
    end
  end

  def ai_move(player_presenter) 
    if is_second_player?
      best_move = @game.ai.find_best_move(@game.board, player_presenter.player_two_mark, player_presenter.player_one_mark)
      @game.board[best_move] = player_presenter.player_two_mark
    else
      best_move = @game.ai.find_best_move(@game.board, player_presenter.player_one_mark, player_presenter.player_two_mark)
      @game.board[best_move] = player_presenter.player_one_mark
    end
  end
  
private

  def is_second_player?
    @game.board.count(nil).even?
  end

  def valid_move?(board, move)
    @game.game_rules.valid?(board, move)
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