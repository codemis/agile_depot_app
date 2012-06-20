email_settings = YAML.load_file(File.join(Rails.root.to_s, "config", "config.yml"))[Rails.env]['gmail']
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name             => email_settings['user_name'],
  :password              => email_settings['password'],
  :authentication        => "plain",  
  :enable_starttls_auto => true
}