class Interactor
  def build_from(string)
    JSON.parse string
  end
end