class MockGamePresenter

  attr_accessor :parsed_board, 
                :parsed_settings
  def parse_settings(game)
    @parsed_settings = true
  end

  def parse_board(game)
    @parsed_board = true
  end
end