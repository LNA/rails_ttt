class GamesController < ApplicationController
   skip_before_filter :verify_authenticity_token

  def create
    import_gem_dependencies
    create_board
    create_players
    @players.current_player_type = params[:player_one_type]
    @players.current_player_mark = params[:player_one_mark]
    params[:current_player_type] = params[:player_one_type]
    params[:current_player_mark] = params[:player_one_mark]
    render_board
  end

  def update
    update_gem_dependencies
    process_move
    check_for_winner
  end

#private

  def import_gem_dependencies
    @game = Game.new(WebGameStore.ai, WebGameStore.board, WebGameStore.game_rules)
  end

  def create_board
    @board = @game.board.spaces
    params["board"] = @board
  end

  def create_players
    @players = Players.new(params, Player.new, Player.new)
    @players.create
  end

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
    if params[:current_player_type] == "Human"
      @board.fill(params[:square].to_i, params[:current_player_mark]) 
    else
      ai_move
    end
  end

  def ai_move
    if params[:current_player_type] == "AI"
      if @board.spaces.count(nil).even?
        params[:current_player_mark] = params[:player_two_mark]
      end
      best_move = @ai.find_best_move(@board, params[:current_player_mark], params[:next_player_mark])
      @board.fill(best_move,params[:current_player_mark])
    end
  end

  def check_for_winner
    if @game_rules.game_over?(@board.spaces)
      render "game_over"
    else
      create_players 
      params[:current_player_mark] = @players.next_player_mark
      params[:current_player_type] = @players.next_player_type
      @players.current_player_mark = @players.next_player_mark
      @players.current_player_type = @players.next_player_type
      @board = @board.spaces
      render_board
    end
  end
end