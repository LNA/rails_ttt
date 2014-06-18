class GamePresenter
  def parse_settings(game)
    game.settings.to_json
  end

  def parse_board(game)
    game.board.spaces.to_json
  end
end
