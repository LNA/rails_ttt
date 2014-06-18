require 'spec_helper'

describe GamesController do
  context "#new" do
    let (:request) { get :new }

    it "creates a new game" do
      request
    end
  end
end
