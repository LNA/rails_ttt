class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    session[:game] = Game.new(WebGameStore.ai,         WebGameStore.board,
                              WebGameStore.game_rules, WebGameStore.settings(params)).to_yaml
    redirect_to ('/play')
  end

  def process_board_for_new_game
    session[:game] = YAML.load(session[:game])
    set_board
    if current_player_type == "AI"
      redirect_to ('/ai_move')
    end
    render "board"
  end

 def process_human_move
    set_board
    make_human_move
    progress_game
    process_redirect
    render "board"
  end

  def process_ai_move
    set_board
    ai_turn
    next_board_after_ai_move
  end

  def process_redirect
    redirect_to ('/ai_move') if current_player_type == "AI"
    render "auto_refresh_board" if current_player_type == "AI"
    render "board" if next_player_type == "Human"
  end

  def process_replay
    session.clear
    render "/welcome"
    redirect '/'
  end

  def next_board_after_ai_move
    if current_player_type == "Human"
      redirect_to ('/play') 
    else
      render_auto_refresh_board      
    end
  end

  def render_auto_refresh_board
   render "/auto_refresh_board"
  end

  def game
    session[:game]
  end

  def ai_loop
    until session[:game].game_rules.game_over?(session[:board].spaces)
      ai_turn
      set_board
    end
  end

  def neither_players_are_human?
    session[:game].settings.player_one_type == "AI" && session[:game].settings.player_two_type == "AI"
  end

  def ai_turn
    make_ai_move  if current_player_type == "AI"
    progress_game if current_player_type == "AI"
  end

  def make_ai_move
    best_move = session[:game].ai.find_best_move(session[:game].board, session[:game].settings.current_player_piece, session[:game].settings.next_player_piece)
    session[:game].board.fill(best_move, session[:game].settings.current_player_piece)
  end

  def either_player_is_the_ai?
    session[:game].settings.player_one_type == "AI" || session[:game].settings.player_two_type == "AI"
  end

  def progress_game
    check_for_winner
    next_player
    next_player_type
  end

  def next_player
    session[:game].settings.current_player_piece = session[:game].settings.next_player_piece
  end

  def next_player_type
    session[:game].settings.current_player_type = session[:game].settings.next_player_type
  end

  def current_player_type
    session[:game].settings.current_player_type
  end

  def set_board
    @board = session[:game].board.spaces
  end

  def make_human_move
    session[:game].board.fill(fetch_square.to_i, session[:game].settings.current_player_piece)
  end

  def fetch_square
    params.fetch("square")
  end

  def check_for_winner
    redirect '/winner' if session[:game].game_rules.game_over?(session[:game].board.spaces)
  end
end