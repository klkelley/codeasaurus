class Users::InvitationsController < Devise::InvitationsController
  def new
    redirect_to root_path unless current_user.teacher?
  end

  def update
    super
    current_user.teacher = true
    current_user.save
    p current_user
  end
end
