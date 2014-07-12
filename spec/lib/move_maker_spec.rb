require 'spec_helper'

describe MoveMaker do 
  let(:mock_game)       { MockGame.new(mock_ai, board, game_rules, player_one, player_two) }
  let(:mock_move_maker) { MockMoveMaker.new }

  it "makes a human move" do 
    expect(mock_move_maker.make_human_move(double, double, double)).to eq(true)
  end

  it "makes an ai move" do 
    expect(mock_move_maker.ai_move(double)).to eq(true)
  end
end