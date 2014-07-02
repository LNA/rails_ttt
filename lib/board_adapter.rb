class BoardAdapter
  attr_accessor :player

  def initialize(listner, player)
    @listner = listner
    @player = player
  end

  AI = "AI"

  def render_board
    if @player == AI 
      @listner.render_auto_refresh_board
    else
      @listner.render_human_board
    end
  end
end