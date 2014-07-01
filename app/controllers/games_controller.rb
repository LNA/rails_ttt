class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create #pass only data i need instad of all of the params
    @game_factory = GameFactory.new(params)
    @game_factory.create
    board_adapter = BoardAdapter.new(self, @game_factory.game.players.current_player_type) #don't pass self in
    board_adapter.render_board
  end

  def update
    update_gem_dependencies
    process_move
    update_adapter = UpdateAdapter.new(self, @game_rules, @board) #don't pass self
    update_adapter.check_for_winner(params)
  end

  def render_auto_refresh_board
    render "auto_refresh_board"
  end

  def render_human_board
    render "board"
  end

  def render_game_over
    render "game_over"
  end

  def update_gem_dependencies #rename and wrap
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

  def update_game(params)
    @game_factory = GameFactory.new(params)
    @game_factory.updated_game    
    @game_factory.game.board.spaces = @board.spaces
    adapter = BoardAdapter.new(self, @game_factory.game.players.current_player_type) #don't pass self
    adapter.render_board
  end
end