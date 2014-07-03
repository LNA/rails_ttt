class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create 
    @game = WebGameStore.game(params)
    board_adapter = BoardAdapter.new(self, @game.players.current_player_type) 
    board_adapter.render_board # What potential downfalls?
  end

  def update 
    @game = WebGameStore.updated_game(params)

    @string_processor = StringToObjectProcessor.new
    @game.board.spaces = @string_processor.build_from(params[:board])

    process_move(@game.players.current_player_mark, @game.players.current_player_type, @game.players.player_one.mark, @game.players.player_two.mark, @game.players.next_player_mark, params[:square].to_i)
    params[:board] = @game.board.spaces.to_s

    update_adapter = UpdateAdapter.new(self, @game) 
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

  def process_move(current_player_mark, current_player_type, player_one_mark, player_two_mark, next_player_mark, move)  
    @processor = MoveProcessor.new(@game)
    @processor.process(current_player_mark, current_player_type, player_one_mark, player_two_mark, next_player_mark, move)
  end

  def update_game(params) 
    @game = WebGameStore.updated_game(params)

    @string_processor = StringToObjectProcessor.new
    @game.board.spaces = @string_processor.build_from(params[:board])

    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type

    adapter = BoardAdapter.new(self, @game.players.current_player_type) 
    adapter.render_board
  end
end