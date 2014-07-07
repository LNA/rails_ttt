require 'spec_helper'

describe MoveMaker do 
  let(:mock_ai)         { MockAI.new}
  let(:game_rules)      { GameRules.new }
  let(:board)           { Board.new }
  let(:mock_game)       { MockGame.new(mock_ai, board.spaces, game_rules, double) }
  let(:move_maker)      { MoveMaker.new(mock_game) }

  it "makes a human move on an open space" do 
    move_maker.make_human_move("X", 0)

    expect(mock_game.board[0]).to eq("X")
  end

  it "wont make a human move on a taken space" do 
    move_maker.make_human_move("X", 0)
    move_maker.make_human_move("O", 0)

    expect(mock_game.board[0]).to eq("X")
  end
end