class StringToObjectProcessor #better name
  def build_from(string)
    eval(string)
  end
end