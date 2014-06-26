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

  def self.players(params)
    Players.new(params, Player.new, Player.new)
  end
end