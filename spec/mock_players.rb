class MockPlayers
  attr_accessor :created_player_one,
                :created_player_two


  def create
    @created_player_one = true
    @created_player_two = true
  end
end
