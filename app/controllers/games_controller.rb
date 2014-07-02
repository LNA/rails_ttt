class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create #pass only data i need instad of all of the params
    player_one_mark = ParamProcessor.new(params).process(:player_one_mark)
    player_one_type = ParamProcessor.new(params).process(:player_one_type)
    player_two_mark = ParamProcessor.new(params).process(:player_two_mark)
    player_two_type = ParamProcessor.new(params).process(:player_two_type)
   
    @game = WebGameStore.ttt_wrapper(player_one_mark, player_one_type, player_two_mark, player_two_type)
    @game.players.create
    board_adapter = BoardAdapter.new(self, @game.players.current_player_type) 
    board_adapter.render_board # What potential downfalls?
  end

  def update 
    @game = WebGameStore.update_ttt_wrapper(params)
    @string_processor = StringToObjectProcessor.new
    @game.board.spaces = @string_processor.build_from(params[:board])
    process_move
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

  def process_move  
    @processor = MoveProcessor.new(params, @game)
    @processor.process
  end

  def update_game(params) 
    @game = WebGameStore.update_ttt_wrapper(params)
    @string_processor = StringToObjectProcessor.new
    @game.board.spaces = @string_processor.build_from(params[:board])
    @game.players.create
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
    adapter = BoardAdapter.new(self, @game.players.current_player_type) 
    adapter.render_board
  end
end