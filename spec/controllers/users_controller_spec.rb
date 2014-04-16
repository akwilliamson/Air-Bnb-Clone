require 'spec_helper'

describe UsersController do

  describe "GET 'listings'" do
    it "returns http success" do
      get 'listings'
      response.should be_success
    end
  end

end
