class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @game_factory = GameFactory.new(params)
    @game_factory.create
    board_adapter = BoardAdapter.new(self, @game_factory.game.players.current_player_type)
    board_adapter.render_board
  end

  def update
    update_gem_dependencies
    process_move
    check_for_winner(params)
  end

  def render_auto_refresh_board
    render "auto_refresh_board"
  end

  def render_human_board
    render "board"
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
      @game_factory = GameFactory.new(params)
      @game_factory.updated_game    
      @game_factory.game.board.spaces = @board.spaces
      adapter = BoardAdapter.new(self, @game_factory.game.players.current_player_type)
      adapter.render_board
    end
  end
end