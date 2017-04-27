class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(fname: params[:user][:fname], lname: params[:user][:lname], username: params[:user][:username], password: params[:user][:password]  )
    redirect_to home_path
  end

# shows the user information
  def show
    @user = User.find(params[:id])
  end

# deletes the user
  def destroy

    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Profile deleted successfully."
    else
      flash[:alert] = "There was a problem deleting the profile"
    end
    # will work with posts

    redirect_to home_path
  end
end
