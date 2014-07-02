class ParamProcessor
  def initialize(params)
    @params = params
  end

  def process(symbol)
    @params[symbol]
  end
end