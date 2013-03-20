class UserMailer < ActionMailer::Base
  default from: "mwwang@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #

  def welcome_mail(user)
    @user = user
    mail(to: user.email, subject: "Welcome to XLearn!").deliver
  end
end
