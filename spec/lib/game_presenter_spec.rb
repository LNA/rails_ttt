require 'spec_helper'

describe GamePresenter do
  let (:mock_game_rules)       { MockGameRules.new}
  let (:mock_ai)               { MockAI.new}
  let (:board)                 { Board.new}
  let (:mock_players)          { MockPlayers.new}
  let (:mock_game)             { MockGame.new(mock_ai, board, mock_game_rules, mock_players)}
  let (:test_presenter)        { GamePresenter.new(mock_game)}


  it "converts the board to a string" do 
    expect(test_presenter.build_board). 
          to eq ("[nil, nil, nil, nil, nil, nil, nil, nil, nil]")
  end
end
