class UsersController < ApplicationController


  def new
    @user = User.new

  end


  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path, :notice => 'User successfully added.'
    end
  end

end
