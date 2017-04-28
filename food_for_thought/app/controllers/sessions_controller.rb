class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Sign in successful"
      redirect_to home_path
    else
      flash[:alert] = "Error: Unable to sign in"
      redirect_to home_path
    end
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end
