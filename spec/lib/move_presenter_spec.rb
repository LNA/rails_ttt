require 'spec_helper'

describe MovePresenter do 
  let(:test_board)            { [nil] * 9 }
  let(:game_rules)            { GameRules.new }
  let(:mock_game)             { MockGame.new(double, test_board, game_rules, double, double) }
  let(:mock_move_processor)   { MockMoveProcessor.new}
  let(:mock_player_presenter) { MockPlayerPresenter.new(mock_game) }

  it "presents a move" do 

    expect(MovePresenter.present_move(mock_game, 0, mock_player_presenter)).to eq(true)
  end
end