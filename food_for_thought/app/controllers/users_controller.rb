class UsersController < ApplicationController
  def index
    @users = User.all
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
