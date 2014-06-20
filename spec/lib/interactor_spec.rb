require 'spec_helper'

describe Interactor do
  let (:test_interactor) { Interactor.new}
  let (:test_string)     { "[nil, nil, nil, nil, nil, nil, nil, nil, nil]" }

  it "converts the board from a string to a ruby object" do
    expect(test_interactor.build_from(test_string)).
           to eq([nil, nil, nil, nil, nil, nil, nil, nil, nil])
  end
end