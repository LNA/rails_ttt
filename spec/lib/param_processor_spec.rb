require 'spec_helper'

describe ParamProcessor do 
  let(:params)         { {:player_one_type=>"Human", :player_one_mark=>"X"} }
  let(:test_processor) { ParamProcessor.new(params)}

  it "finds and returns a string from the params" do 
    expect(test_processor.process(:player_one_mark)).to eq("X")
  end
end