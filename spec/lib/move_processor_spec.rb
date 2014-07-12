require 'spec_helper'

describe MoveProcessor do 
  let(:mock_presenter) { MockMoveProcessor.new}

  it "processes a move" do 
    expect(mock_presenter.process(double, double, double)).to eq(true)
  end
end