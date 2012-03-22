# coding: utf-8
class Ruser::UserMailer < Ruser::BaseMailer
  def welcome(user_id)
    @user = Ruser::User.find_by_id(user_id)
    return false if @user.blank?
#    mail(:to => @user.email, :subject => "#{t("mail.welcome_subject", :app_name => Setting.app_name)}")
mail(:to => @user.email, :subject => "#{t("mail.welcome_subject", :app_name => "ruser")}")
  end

  class Preview < MailView
    # Pull data from existing fixtures
    def welcome
      ::UserMailer.welcome(Ruser::User.last.id)
    end
  end
end
