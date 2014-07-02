class GamePresenter #make more functional 
  attr_accessor :game, :params

  def initialize(game)
    @game = game
  end

  def create
    create_players
    create_board
  end

  def updated_game #ABS
    binding.pry
    import_gem_dependencies
    create_players
    set_next_player_params  
  end

  def create_board
    @board = @game.board.spaces
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

  def set_next_player_params
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
  end


  def set_next_player_params
    @game.players.current_player_mark = @game.players.next_player_mark
    @game.players.current_player_type = @game.players.next_player_type
  end
end