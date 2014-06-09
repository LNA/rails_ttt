class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    session[:game] = Game.new(WebGameStore.ai,         WebGameStore.board,
                              WebGameStore.game_rules, WebGameStore.settings(params)).to_yaml
    redirect_to ('/play')

  end

  def process_board_for_new_game
    session[:game] = YAML.load(session[:game])
  end
end
