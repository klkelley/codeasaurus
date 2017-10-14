class TeacherMailer < ApplicationMailer
  default from: "codeasaurus.dbc@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sign Up For Codeasaurus')
  end
end
