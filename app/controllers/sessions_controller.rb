# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :user_from_form, only: [:create]
  before_action :logged_in_redirect, except: [:destroy]

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

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged in'
    redirect_to login_path
  end

  private

  def user_from_form
    @user = User.find_by(username: params[:user][:username].downcase)
  end

  def logged_in_redirect
    if logged_in?
      flash[:negative] = 'You are already logged in.'
      redirect_to root_path
    end
  end
end