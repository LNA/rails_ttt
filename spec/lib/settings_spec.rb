require 'spec_helper'

describe Settings do
  let (:player_one)      { Player.new('X', "human")}
  let (:player_two)      { Player.new('O', "ai")}
  let (:params)          { {:current_player => player_one, :next_player => player_two} }
  let (:test_settings)   { Settings.new( params) }

  it "has a current player" do
    expect(test_settings.current_player).to eq(player_one)
  end

  it "has a next player" do
    expect(test_settings.next_player).to eq(player_two)
  end
end
