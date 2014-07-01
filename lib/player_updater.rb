class PlayerUpdater
  attr_accessor :settings

  # def initialize(settings)
  #   @settings = settings
  # end

  # def update_players
  #   settings.params[:current_player_mark]  = settings.game.players.next_player_mark
  #   settings.params[:current_player_type]  = settings.game.players.next_player_type
  #   next_player
  # end

  # def next_player
  #   settings.game.players.current_player_mark = settings.game.players.next_player_mark
  #   settings.game.players.current_player_type = settings.game.players.next_player_type
  # end

  # def next_player_mark
  #   @current_player_mark == @player_one.mark ? @player_two.mark : @player_one.mark
  # end
end
