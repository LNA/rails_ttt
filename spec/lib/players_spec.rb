require 'spec_helper'

describe Players do
  let (:params)    {  {"player_one_type"=>"Human",
                       "player_one_mark"=>"X",
                       "player_two_type"=>"AI",
                       "player_two_mark"=>"O"}  }

  let (:player_one)    {Player.new}
  let (:player_two)    {Player.new}
  let (:test_players)  {Players.new(params, player_one, player_two)}

  it "creates both player types" do 
    test_players.create

    expect(test_players.player_one.type).to eq('Human')
    expect(test_players.player_two.type).to eq('AI')
  end

  it "creates both player marks" do 
    test_players.create

    expect(test_players.player_one.mark).to eq('X')
    expect(test_players.player_two.mark).to eq('O')
  end
end
