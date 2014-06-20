require 'spec_helper'

describe Players do
  let (:params)    {  {"player_one_type"=>"Human",
                       "player_one_mark"=>"X",
                       "player_two_type"=>"AI",
                       "player_two_mark"=>"O"}  }

  let (:player_one)    {Player.new}
  let (:player_two)    {Player.new}
  let (:test_players)  {Players.new(params, player_one, player_two)}

  before (:each) do 
    test_players.create
  end

  it "creates both player types" do 
    expect(test_players.player_one.type).to eq('Human')
    expect(test_players.player_two.type).to eq('AI')
  end

  it "creates both player marks" do 
    expect(test_players.player_one.mark).to eq('X')
    expect(test_players.player_two.mark).to eq('O')
  end

  it "returns the mark of the next player" do   
    expect(test_players.next_player_mark).to eq('O')
  end

  it "returns the type for the next player" do 
    expect(test_players.next_player_type).to eq('AI')
  end
end