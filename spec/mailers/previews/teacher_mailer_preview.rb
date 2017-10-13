# Preview all emails at http://localhost:3000/rails/mailers/teacher_mailer
class TeacherMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    TeacherMailer.sample_email(User.last)
  end
end
