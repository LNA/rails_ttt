require 'spec_helper'
require 'mock_ai'

describe GamesController do
  let (:mock_ai)         { MockAI.new }
  let (:mock_board)      { MockBoard.new  }
  let (:mock_game_rules) { MockGameRules.new  }
  let (:mock_settings)   { MockSettings.new   }

  before :each do
    @mock_game = Game.new(mock_ai, mock_board, mock_game_rules, mock_settings)
    @mock_game.settings.current_player_piece = 'X'
  end

  context 'new game' do
    it 'creates a new game' do
      post '/new_game'
    end
  end
end