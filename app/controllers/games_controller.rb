class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create 
    @game = WebGameStore.game(params)
    @player_presenter = PlayerPresenter.new(@game)
    board_adapter = BoardAdapter.new(self, @player_presenter.current_player_type)  
    board_adapter.render_board 
  end

  def update  
    @game = WebGameStore.updated_game(params)
    @player_presenter = PlayerPresenter.new(@game)
    @game.board = StringToObjectProcessor.new.build_from(params[:board])
    MovePresenter.present_move(@game, params[:square].to_i, @player_presenter) 
    board_wrapper = BoardWrapper.new(@game)
    params[:board] = board_wrapper.convert_board_to_string
    update_adapter = UpdateAdapter.new(self, @game) 
    update_adapter.check_for_winner(params)
  end

  def update_game(params) 
    @game = WebGameStore.updated_game(params)
    @game.board = StringToObjectProcessor.new.build_from(params[:board])
    @player_presenter = PlayerPresenter.new(@game)
    board_adapter = BoardAdapter.new(self, @player_presenter.current_player_type) 
    board_adapter.render_board
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
end