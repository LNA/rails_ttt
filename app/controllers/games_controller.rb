class GamesController < ApplicationController
  def create
    game = Game.new(WebGameStore.ai,         WebGameStore.board,
                    WebGameStore.game_rules, WebGameStore.settings(params))
    @game_presenter = GamePresenter.new(game).build
  end

  def update
    get a move
    post back all game params to the interactor
    use the interactor to convert back to objects
    process move on board
    game presenter to serve to the view
  end
end