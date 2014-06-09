class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @settings = Settings.new(params)
  end

  def welcome
  end

  def auto_refresh_board
  end

  def board
  end

  def game_over
  end

  def new_game
  end
end
