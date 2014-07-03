require 'spec_helper'

describe MoveAdapter do 
  let(:mock_board)      { MockBoard.new}
  let(:mock_game)       { MockGame.new(double, mock_board, double, double) }
  let(:mock_move_maker) { MockMoveMaker.new}
  let(:test_adapter)    { MoveAdapter.new(mock_game, mock_move_maker)}

  it "processes the current player" do 
    test_adapter.game.board.spaces = [nil] * 9

    expect(test_adapter.process_current_player("X", "O")).to eq("X")
  end

  it "processes the next player" do 
    test_adapter.game.board.spaces = [nil] * 9
    test_adapter.game.board.spaces[0] = "X"

    expect(test_adapter.process_next_player("X", "O")).to eq("O")
  end

  it "processes a move" do 
    test_adapter.process_move("X", "Human", "O", 4)
    expect(test_adapter.move_maker).stub(:made_human_move).and_return(true)
  end

  context '#is_second_player?' do
    it "returns true for a second player" do
      test_adapter.game.board.spaces = [nil] * 9
      test_adapter.game.board.spaces[0] = "X"

      expect(test_adapter.is_second_player?).to eq(true)
    end

    it "returns false for the first player" do
      test_adapter.game.board.spaces = [nil] * 9

      expect(test_adapter.is_second_player?).to eq(false)
    end
  end
end