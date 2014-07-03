class StringToObjectProcessor 
  def build_from(string)
    eval(string)
  end
end