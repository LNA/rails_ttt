class GameFactory#rename, make more functional 
  attr_accessor :game, :params, :players

  def initialize(game, params)
    @game = game 
    @params = params
  end

  def create
    create_players
    set_next_player_params 
    create_board
    set_current_player
  end

  def create_board
    @board = @game.board.spaces
    @params["board"] = @board
  end

  def create_players
    @game.players.create
  end

  def set_current_player_params #more than one thing
    @game.players.current_player_type = params[:player_one_type]
    @game.players.current_player_mark = params[:player_one_mark]
    params[:current_player_type]      = params[:player_one_type] #ABS params; look into strategy or another pattern
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