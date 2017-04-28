class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.fname = params[:user][:fname]
    @user.lname = params[:user][:lname]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]


    if @user.save
      flash[:notice] = "Changes saved!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Unable to save changes"
      redirect_to edit_user_path(@user)
    end
  end

  def create

    @user = User.create(
      fname: params[:user][:fname],
      lname: params[:user][:lname],
      username: params[:user][:username],
      password: params[:user][:password]
    )

    session[:user_id] = @user.id

    if @user.save
      flash[:notice] = "Profile created!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Unable to create profile"
      redirect_to new_user_path
    end
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
      session[:user_id] = nil
    else
      flash[:alert] = "There was a problem deleting the profile"
    end
    # will work with posts

    redirect_to home_path
  end
end
