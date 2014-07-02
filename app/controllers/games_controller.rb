class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create #pass only data i need instad of all of the params
    @game = WebGameStore.ttt_wrapper(params)
    @game_factory = GameFactory.new(@game, params)
    @game_factory.create
    board_adapter = BoardAdapter.new(self, @game_factory.game.players.current_player_type) #defend
    board_adapter.render_board # What potential downfalls?
  end

  def update 
    @game = WebGameStore.update_ttt_wrapper(params)
    @interactor = Interactor.new
    @game.board.spaces = @interactor.build_from(params[:board])
    process_move
    params[:board] = @game.board.spaces.to_s
    update_adapter = UpdateAdapter.new(self, @game) #defend
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

  def update_game(params) #making the move but not storing
    @game = WebGameStore.update_ttt_wrapper(params)
    @interactor = Interactor.new
    @game.board.spaces = @interactor.build_from(params[:board])
    @game.players.create
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
    # binding.pry
    adapter = BoardAdapter.new(self, @game.players.current_player_type) 
    adapter.render_board
  end
end