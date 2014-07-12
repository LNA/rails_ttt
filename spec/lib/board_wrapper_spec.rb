require 'spec_helper'

describe BoardWrapper  do
  let(:mock_game)    { MockGame.new(double, double, double, double, double)}
  let(:test_wrapper) { BoardWrapper.new(mock_game)}

  it "returns the board as a string" do 
    mock_game.board = [nil]
    
    expect(test_wrapper.convert_board_to_string).to eq("[nil]")
  end
end