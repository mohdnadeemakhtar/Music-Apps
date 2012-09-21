require 'spec_helper'

describe UsersController do

  before(:each) do
    User.stub!(:new).and_return(@user= mock_model(User,:save=>true))
  end

  describe "POST 'create'" do
    it "shoud be successful" do
      post 'create'
      assigns[:album].should_not be_new_record
      flash[:notice].should_not be_nil

      response.should redirect_to(login_path)
    end

    it "should not be valid with wrong formated email" do
      @user.email = 'b@info'
      @user.should_not be_valid_on_create
    end



  end

end