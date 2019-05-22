ActionMailer::Base.smtp_settings = {
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :domain => 'yourdomain.com',
    :user_name => 'davidcantum',
    :password => 'Dcm181214',
    :authentication => :login,
    :enable_starttls_auto => true
  }