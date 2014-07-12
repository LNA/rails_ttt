class MockPlayerPresenter

  attr_accessor :current_player, 
                :player_one_mark, :player_two_mark,
                :player_one_type, :player_two_type 


  def initialize(game)
    @game = game 
  end

  def player_one_mark
    @wrapped_player_one_mark = 'X'
  end

  def player_one_type
    @wrapped_player_one_type = 'Human'
  end

  def player_two_mark
    @wrapped_player_two_mark = 'O'
  end

  def player_two_type
    @wrapped_player_two_type = 'Human'
  end

  def current_player_mark
    @wrapped_current_player_mark = true
  end

  def current_player_type
    @wrapped_current_player_type = true
  end

  def next_player_mark
    @wrapped_next_player_mark = true
  end

  def next_player_type
    @wrapped_next_player_type = true
  end

  def current_player
    @wrapped_current_player = true
  end
end