class GamePresenter
  def parse_settings(game)
    game.settings.instance_values
  end

  def parse_board(game)
    binding.pry
    game.board.spaces.to_s
  end
end
