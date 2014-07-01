require 'spec_helper'

describe BoardAdapter do 
  let(:listner) { double }
  let(:test_human)  {"Human"}
  let(:test_ai)     {"AI"}
  let(:render_auto_refresh_board) { "board"}
  let(:render_human_board) { "board"}

  it "sends a message to render the ai auto_refresh_board" do 
    test_adapter = BoardAdapter.new(listner, test_ai)
    expect(listner).to receive(:render_auto_refresh_board)
    test_adapter.render_board
  end

  it "sends a message to render the human board" do 
    test_adapter = BoardAdapter.new(listner, test_human)
    expect(listner).to receive(:render_human_board)
    test_adapter.render_board
  end
end