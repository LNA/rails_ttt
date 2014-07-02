class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create #pass only data i need instad of all of the params
    @game = WebGameStore.ttt_wrapper(params)
    @game_factory = GameFactory.new(@game, params)
    @game_factory.create
    board_adapter = BoardAdapter.new(self, @game_factory.game.players.current_player_type) #don't pass self in
    board_adapter.render_board
  end

  def update
    @game = WebGameStore.update_ttt_wrapper(params)
    @interactor = Interactor.new
    @game.board.spaces = @interactor.build_from(params[:board])
    process_move
    update_adapter = UpdateAdapter.new(self, @game) #don't pass self
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

  def process_move  
    @process_move = ProcessMove.new(params, @game)
    @process_move.process
  end

  def update_game(params)
    @game = WebGameStore.update_ttt_wrapper(params)
    @game.players.create
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
    adapter = BoardAdapter.new(self, @game.players.current_player_type) #don't pass self
    adapter.render_board
  end
end