class UsersController < ApplicationController
  before_filter :authenticate

  def edit
    @title = 'Edit Profile'
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user][:email] = params[:user][:email].downcase
    if @user.update_attributes(params[:user])
      if params[:user][:password].length >= 2 && \
          params[:user][:password_confirmation].length >= 2 && \
          @user == current_user
          flash[:success] = "Password changed, 
          please sign in with your new password"
        sign_out
        redirect_to signin_path
      else
        flash[:success] = 'Profile updated'
        redirect_to edit_user_path
      end
    else
      @title = 'Edit Profile'
      render 'edit'
    end
  end
end