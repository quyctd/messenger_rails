class SessionsController < ApplicationController
  def new
    @account = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:negative] = 'Username or password not correct'
      render 'new'
    end
  end
end