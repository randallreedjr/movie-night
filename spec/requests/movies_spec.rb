require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/movies/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/movies/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/movies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
