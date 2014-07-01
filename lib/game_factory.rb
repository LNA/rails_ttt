class GameFactory
  attr_accessor :game, :params

  def initialize(params)
    @params = params 
  end

  def create
    updated_game
    create_board
    set_current_player
  end

  def updated_game
    import_gem_dependencies
    create_players
    set_next_player_params  
  end

  def import_gem_dependencies
    @game = Game.new(WebGameStore.ai, WebGameStore.board, WebGameStore.game_rules, WebGameStore.players(@params))
  end

  def create_board
    @board = @game.board.spaces
    @params["board"] = @board
  end

  def create_players
    @game.players.create
  end

  def set_current_player_params
    @game.players.current_player_type = params[:player_one_type]
    @game.players.current_player_mark = params[:player_one_mark]
    params[:current_player_type]      = params[:player_one_type]
    params[:current_player_mark]      = params[:player_one_mark]
  end

  def set_current_player
    @game.players.current_player_type = params[:player_one_type]
    @game.players.current_player_mark = params[:player_one_mark]
  end

  def set_next_player_params
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
  end
end