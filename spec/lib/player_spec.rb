require 'spec_helper'

describe Player do
  let (:test_player) {Player.new('X', "human")}

  it "has a type" do
    expect(test_player.type).to eq('human')
  end

  it "has a mark" do
    expect(test_player.mark).to eq('X')
  end
end
