require 'spec_helper'

RSpec.describe "GamesControllers", :type => :request do

  describe "GET /games" do
    it "returns the correct response status" do
      get 'games'
      expect(response.status).to eq(200) 
    end

    it "displays the content of the hompage" do
      get 'games'

      expect(response.body).to include("Start")
    end
  end

  describe "POST /games" do
   xit "returns the correct response status" do
      post 'games'
      expect(response.status).to eq(200) 
    end
  end

  describe "POST /new_game" do
    it "returns the correct response status" do
      post 'new_game'
      expect(response.status).to eq(200) 
    end

    it "displays the content of the hompage" do
      post 'new_game'

      expect(response.body).to include("Player 1:")
    end
  end

  describe "POST /move" do
    xit "returns the correct response status" do
      post 'move'
      expect(response.status).to eq(200) 
    end

    xit "displays the content of the hompage" do
      post 'move'

      expect(response.body).to include("Start")
    end
  end

  describe "GET /ai_move" do
    xit "returns the correct response status" do
      get 'ai_move'

      expect(response.status).to eq(200) 
    end
  end
end
