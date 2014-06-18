class MockInteractor
  attr_accessor :built_from_string
  
  def build_from(string)
    @built_from_string = true
  end
end