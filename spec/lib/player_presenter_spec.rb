require 'spec_helper'

describe PlayerPresenter do
  let(:player_one)     { Player.new('X', 'Human') }
  let(:player_two)     { Player.new('O', 'AI')    }
  let(:board)          { [nil] * 9                }
  let(:game)           { MockGame.new(double, board, double, player_one, player_two) }
  let(:test_presenter) { PlayerPresenter.new(game) }

  it "wraps the player one mark" do 
    expect(test_presenter.player_one_mark).to eq('X')
  end

  it "wraps the player one type" do 
    expect(test_presenter.player_one_type).to eq('Human')
  end

   it "wraps the player two mark" do 
    expect(test_presenter.player_two_mark).to eq('O')
  end

  it "wraps the player two type" do 
    expect(test_presenter.player_two_type).to eq('AI')
  end

  it "wraps the current player mark" do 
    expect(test_presenter.current_player_mark).to eq('X')
  end

  it "wraps the next_player_mark" do 
    test_presenter.current_player_mark

    expect(test_presenter.next_player_mark).to eq('O')
  end

  it "wraps the next_player_type" do 
    test_presenter.current_player_type

    expect(test_presenter.next_player_type).to eq('AI')
  end
end
