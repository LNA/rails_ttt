require 'ai'
require 'board'
require 'game'
require 'game_rules'
require 'player'
require 'players'
require 'param_processor'

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

  def self.process(params) # better name
    @player_one_mark = ParamProcessor.new(params).process(:player_one_mark) 
    @player_one_type = ParamProcessor.new(params).process(:player_one_type)
    @player_two_mark = ParamProcessor.new(params).process(:player_two_mark)
    @player_two_type = ParamProcessor.new(params).process(:player_two_type)
  end

  def self.ttt_wrapper
    Game.new(WebGameStore.ai, WebGameStore.board.spaces, WebGameStore.game_rules, WebGameStore.players(@player_one_mark, @player_one_type, @player_two_mark, @player_two_type))
  end

  def self.game(params)
    self.process(params)
    @game = WebGameStore.ttt_wrapper
    @game.players.create
    @game
  end

  def self.updated_game(params)
    self.process(params)
    @game = WebGameStore.update_ttt_wrapper
    @game.players.create 
    @game
  end

  def self.players(player_one_mark, player_one_type, player_two_mark, player_two_type)
    @players = Players.new(@player_one_mark, @player_one_type, @player_two_mark, @player_two_type, Player.new, Player.new)
  end

  def self.update_ttt_wrapper
    Game.new(WebGameStore.ai, WebGameStore.board, WebGameStore.game_rules, WebGameStore.players(@player_one_mark, @player_one_type, @player_two_mark, @player_two_type))
  end
end