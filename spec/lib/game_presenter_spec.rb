require 'spec_helper'

describe GamePresenter do
  let (:test_player)     {Player.new('X', 'human')}
  let (:board)           {Board.new}
  let (:game_rules)      {GameRules.new}
  let (:ai)              {AI.new(game_rules)}
  let (:player_one)      { Player.new('X', "human")}
  let (:player_two)      { Player.new('O', "ai")}
  let (:params)          { {:current_player => player_one, :next_player => player_two} }
  let (:settings)        {Settings.new( params)}
  let (:game)            {Game.new(ai, board, game_rules, settings)}
  let (:test_presenter)  {GamePresenter.new(game)}


  it "converts the board to a string" do 
    expect(test_presenter.build_board). 
          to eq ("[nil, nil, nil, nil, nil, nil, nil, nil, nil]")
  end

  it "converts the current player to a string" do 
    expect(test_presenter.build_current_player). to eq ("X")
  end
end
