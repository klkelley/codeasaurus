class Users::InvitationsController < Devise::InvitationsController
  def new
    p "InvitationsController"
    @user = User.find(3)

    TeacherMailer.sample_email(@user).deliver
  end
end
