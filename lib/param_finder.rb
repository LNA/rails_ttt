class ParamFinder
  def initialize(params)
    @params = params
  end

  def find_param(symbol)
    @params[symbol]
  end
end