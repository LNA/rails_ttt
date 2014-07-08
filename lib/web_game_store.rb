require 'ai'
require 'board'
require 'game'
require 'game_rules'
require 'player'
require 'param_finder'

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

  def self.create_players_from(params) 
    @player_one_mark = ParamFinder.new(params).find_param(:player_one_mark) 
    @player_one_type = ParamFinder.new(params).find_param(:player_one_type)
    @player_two_mark = ParamFinder.new(params).find_param(:player_two_mark)
    @player_two_type = ParamFinder.new(params).find_param(:player_two_type)
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

  def self.player_one
    @player_one = Player.new(@player_one_mark, @player_one_type)
  end

  def self.player_two
    @player_two = Player.new(@player_two_mark, @player_two_type)
  end

  def self.ttt_wrapper
    Game.new(WebGameStore.ai, WebGameStore.board.spaces, WebGameStore.game_rules, WebGameStore.player_one, WebGameStore.player_two)
  end

  def self.game(params)
    self.create_players_from(params)
    @game = WebGameStore.ttt_wrapper
  end

  def self.updated_game(params)
    self.create_players_from(params)
    @game = WebGameStore.update_ttt_wrapper
  end

  def self.update_ttt_wrapper
    Game.new(WebGameStore.ai, WebGameStore.board, WebGameStore.game_rules, WebGameStore.player_one, WebGameStore.player_two)
  end
end