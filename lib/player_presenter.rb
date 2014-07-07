class PlayerPresenter
  attr_accessor :current_player_mark, :game, :player_one_mark, :player_two_mark

  def initialize(game)
    @game = game 
  end

  def player_one_mark
    @player_one_mark = @game.player_one.mark 
  end

  def player_one_type
    @game.player_one.type
  end

  def current_player_mark
    @current_player_mark = @game.player_one.mark
  end

  def current_player_type
    @game.player_one.type 
  end

  def player_two_mark
    @player_two_mark = @game.player_two.mark 
  end

  def player_two_type
    @game.player_two.type 
  end

  def next_player_mark
    @current_player_mark  == @player_one_mark ? @player_two_mark : @player_one_mark
  end

  def next_player_type
    @current_player_type  == player_one_type ? player_two_type : player_one_type
  end
end