class GamesController < ApplicationController
  attr_accessor :game
  before_filter :set_interactor

  skip_before_action :verify_authenticity_token

  def create
    session[:game] = Game.new(WebGameStore.ai,         WebGameStore.board,
                            WebGameStore.game_rules, WebGameStore.settings(params))
    redirect_to ('/play')
  end

  def update
    @interactor.process_board_for_new_game
  end

private
  
  def set_interactor
    @interactor = Interactor.new
  end
end