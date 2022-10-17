class NewUserMailer < ApplicationMailer
    default from: "hoge@example.com"

    def to_user(user)
      @user = user
      mail to: user.email, cc: 'cc@example.com', bcc: 'bcc@example.com', subject: 'ご登録ありがとうございます！'
    end
end
