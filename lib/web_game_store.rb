require 'ai'
require 'board'
require 'game'
require 'game_rules'
require 'player'
require 'players'

class WebGameStore
  @@games = []

  def self.games
    return @@games
  end

  def self.games
    @@games
  end

  def self.store(game)
    @@games << self
  end

  def self.game_rules
    @game_rules = GameRules.new
  end

  def self.board
    @board = Board.new
  end

  def self.ai
    @ai = AI.new(GameRules.new)
  end


  def self.ttt_wrapper(player_one_mark, player_one_type, player_two_mark, player_two_type)
    Game.new(WebGameStore.ai, WebGameStore.board, WebGameStore.game_rules, WebGameStore.players(player_one_mark, player_one_type, player_two_mark, player_one_type))
  end

  def self.players(player_one_mark, player_one_type, player_two_mark, player_two_type)
    @players = Players.new(player_one_mark, player_one_type, player_two_mark, player_two_type, Player.new, Player.new)
  end

  def self.update_ttt_wrapper(params)
    Game.new(WebGameStore.ai, WebGameStore.board, WebGameStore.game_rules, WebGameStore.players(params))
  end
end