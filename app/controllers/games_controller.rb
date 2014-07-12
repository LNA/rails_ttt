class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  AI = "AI"

  def create 
    @game = GameWrapper.game(params)
    @player_presenter = PlayerPresenter.new(@game)
    if @player_presenter.current_player == AI 
      render_auto_refresh_board
    else
      render_human_board
    end
  end

  def update  
    @game = GameWrapper.updated_game(params)
    @player_presenter = PlayerPresenter.new(@game)
    @game.board = StringToObjectProcessor.new.build_from(params[:board])
    MovePresenter.present_move(@game, params[:square].to_i, @player_presenter) 
    board_wrapper = BoardWrapper.new(@game)
    params[:board] = board_wrapper.convert_board_to_string
    if @game.game_rules.game_over?(@game.board)
      render_game_over
    else
      update_game(params)
    end
  end

  def update_game(params) 
    @game = GameWrapper.updated_game(params)
    @game.board = StringToObjectProcessor.new.build_from(params[:board])
    @player_presenter = PlayerPresenter.new(@game)
    if @player_presenter.current_player == AI 
      render_auto_refresh_board
    else
      render_human_board
    end
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