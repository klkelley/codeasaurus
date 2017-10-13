class Users::InvitationsController < Devise::InvitationsController
  def new
  end

  def update
    super
    current_user.teacher = true
    current_user.save
    p current_user
  end
end
