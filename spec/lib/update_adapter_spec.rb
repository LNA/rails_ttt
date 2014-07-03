require 'spec_helper'

describe UpdateAdapter do 
  let(:listner)          { double }
  let(:game)             { double }
  let(:params)           { double }
  let(:render_game_over) { double }
  let(:update_game)      { double }

  xit "sends a message to render game over in case of a winner" do 
    test_adapter = UpdateAdapter.new(listner, game)
    expect(listner).to receive(:render_game_over)
    test_adapter.check_for_winner(params)
  end

  xit "sends a message to update the game when no winner" do 
    test_adapter = UpdateAdapter.new(listner, game)
    expect(listner).to receive(:update_game)
    test_adapter.check_for_winner(params)
  end
end
