class SessionsController < ApplicationController
  before_action :user_from_form, only: [:create]

  def new
    @account = User.new
  end

  def create
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:negative] = 'Username or password not correct'
      render 'new'
    end
  end

  private

  def user_from_form
    @user = User.find_by(username: params[:user][:username].downcase)
  end
end