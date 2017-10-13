class UsersController < ApplicationController
  def new

  end

  def invite_user
    p params
    p "invite_user"
    # @user = User.last

    # TeacherMailer.sample_email(@user).deliver
    @user = User.invite!(email: params[:user][:email])
    redirect_to root_path
  end

end
