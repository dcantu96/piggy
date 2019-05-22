class UserNotifierMailer < ApplicationMailer
    default :from => 'support@piggysavings.com'
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_category_limit_alert(user, path)
      @user = user
      @path = path
      mail( :to => @user.email,
      :subject => 'You have exceded the mailer amount.' )
    end
  end