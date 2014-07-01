require 'spec_helper'

describe UpdateAdapter do 
  let(:listner)          { double }
  let(:game_rules)       { GameRules.new }
  let(:board)            { Board.new}
  let(:params)           { double }
  let(:render_game_over) { double }
  let(:update_game)      { double }

  it "sends a message to render game over in case of a winner" do 
    board.spaces = ['X'] * 9
    test_adapter = UpdateAdapter.new(listner, game_rules, board)
    expect(listner).to receive(:render_game_over)
    test_adapter.check_for_winner(params)
  end

  it "sends a message to update the game when no winner" do 
    board.spaces = [nil] * 9
    test_adapter = UpdateAdapter.new(listner, game_rules, board)
    expect(listner).to receive(:update_game)
    test_adapter.check_for_winner(params)
  end
end
