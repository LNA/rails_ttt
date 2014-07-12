require 'ai'
require 'board'
require 'game'
require 'game_rules'
require 'player'
require 'param_finder'

class GameWrapper
  def self.create_players_from(params) 
    @player_one_mark = ParamFinder.new(params).find_param(:player_one_mark) 
    @player_one_type = ParamFinder.new(params).find_param(:player_one_type)
    @player_two_mark = ParamFinder.new(params).find_param(:player_two_mark)
    @player_two_type = ParamFinder.new(params).find_param(:player_two_type)
  end

  def self.game_rules
    GameRules.new
  end

  def self.board
    Board.new
  end

  def self.ai
   AI.new(GameRules.new)
  end

  def self.player_one
   Player.new(@player_one_mark, @player_one_type)
  end

  def self.player_two
    Player.new(@player_two_mark, @player_two_type)
  end

  def self.ttt_wrapper
    Game.new(GameWrapper.ai, GameWrapper.board.spaces, GameWrapper.game_rules, GameWrapper.player_one, GameWrapper.player_two) #remove duplication
  end

  def self.game(params)
    self.create_players_from(params)
    GameWrapper.ttt_wrapper
  end

  def self.updated_game(params)
    self.create_players_from(params)
    GameWrapper.update_ttt_wrapper
  end

  def self.update_ttt_wrapper
    Game.new(GameWrapper.ai, GameWrapper.board, GameWrapper.game_rules, GameWrapper.player_one, GameWrapper.player_two)
  end
end