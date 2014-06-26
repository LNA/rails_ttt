class GamesController < ApplicationController
   skip_before_filter :verify_authenticity_token

  def create
    @new_game = CreateGame.new(params)
    @new_game.create
    render_board
  end

  def update
    update_gem_dependencies
    process_move
    check_for_winner(params)
  end

private
  def render_board
    if params[:current_player_type] == "AI" 
      render "auto_refresh_board"
    else
      render "board"
    end
  end

  def update_gem_dependencies
    @board = Board.new
    @game_rules = GameRules.new
    @interactor = Interactor.new
    @ai = AI.new(@game_rules)
    @board.spaces = @interactor.build_from(params[:board])
  end

  def process_move  
    @process_move = ProcessMove.new(params, @board, @ai)
    @process_move.process
  end

  def check_for_winner(params)
    if @game_rules.game_over?(@board.spaces)
      render "game_over"
    else
      @new_game = CreateGame.new(params)
      @new_game.update_game
      @new_game.game.board.spaces = @board.spaces
      render_board
    end
  end
end