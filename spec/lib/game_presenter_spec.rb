require 'spec_helper'

describe GamePresenter do
  let (:test_presenter)  {GamePresenter.new}
  let (:board)           {Board.new}
  let (:game_rules)      {GameRules.new}
  let (:ai)              {AI.new(game_rules)}
  let (:game_rules)      {GameRules.new}
  let (:settings)        {Settings.new}
  let (:game)            {Game.new(ai, board, game_rules, settings)}


  it "returns the game settings as a string" do
    game.settings.current_player_piece = 'X'

    expect(test_presenter.parse_settings(game)).to eq ("{\"player_one_piece\":null,\"player_two_piece\":null,\"player_one_type\":null,\"player_two_type\":null,\"current_player_piece\":\"X\",\"current_player_type\":null}")
  end

  it "returns the board as a string" do
    game.board.spaces[0] = 'X'

    expect(test_presenter.parse_board(game)).to eq ("[\"X\",null,null,null,null,null,null,null,null]" )
  end
end
