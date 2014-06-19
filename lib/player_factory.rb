class PlayerFactory
  attr_accessor :mark, :params, :type, 
                :player_one, :player_two

  def initialize(params = {}, player_one, player_two)
    @params     = params
    @player_one = player_one
    @player_two = player_two
  end

  def create_players
    create_player_one
    create_player_two
  end

private

  def create_player_one
    @player_one.mark = params["player_one_mark"]
    @player_one.type = params["player_one_type"]
  end

   def create_player_two
    @player_two.mark = params["player_two_mark"]
    @player_two.type = params["player_two_type"]
  end
end
