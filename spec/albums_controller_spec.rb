require 'spec_helper'

describe AlbumsController do

  describe "GET 'index'" do
    it "shoud be successful" do
      get 'index'
      response.should have_selector("title", :content => "Yaarana" | Index)
    end
  end

  describe "GET 'show'" do
    it "shoud be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "PUT albums/:id" do

    describe "with valid params" do

      before(:each) do
        @album = mock_model(Album,:update_attributes => true)
        Album.stub!(:find).with("1").return(@album)
      end

      it "should find album and return object" do
        Album.should_receive(:find).with("1").reutrn(@album)
      end

      it "should update the album object's attributes" do
        @album.should_receive(:update_attributes).and_return(true)
      end

      it "should redirect to the album show page" do
        response.should redirect_to(album_url(@album))
      end

    end


  end

end
