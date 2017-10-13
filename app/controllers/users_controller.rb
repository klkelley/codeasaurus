class UsersController < ApplicationController
  def new
  end

  def invite_user
    p params
    @user = User.invite!(email: params[:user][:email])
    redirect_to root_path
  end

end
