class CreateGame
  attr_accessor :game, :params

  def initialize(params)
    @params = params 
  end

  def create
    import_gem_dependencies
    create_board
    create_players
    set_current_player
    set_current_player_params
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
    params[:current_player_type]  = params[:player_one_type]
    params[:current_player_mark]  = params[:player_one_mark]
  end

  def next_player
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
  end

  def set_current_player
    @game.players.current_player_type = params[:player_one_type]
    @game.players.current_player_mark = params[:player_one_mark]
  end

  def update_game
    import_gem_dependencies
    create_players 
    params[:current_player_mark]      = @game.players.next_player_mark
    params[:current_player_type]      = @game.players.next_player_type
    next_player
  end
end