require 'spec_helper'

describe MoveAdapter do 
  let(:test_adapter) { MoveAdapter.new(double, double)}

  it "processes the current player" do 
    expect(test_adapter.process_current_player).to eq(current_player_mark)
  end
end