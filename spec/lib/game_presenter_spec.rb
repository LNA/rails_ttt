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

    expect(test_presenter.parse_settings(game)).to include("current_player_piece"=>"X")
  end

  it "returns the board as a string" do
    game.board.spaces[0] = 'X'

    expect(test_presenter.parse_board(game)).to eq ("[\"X\", nil, nil, nil, nil, nil, nil, nil, nil]")
  end
end
