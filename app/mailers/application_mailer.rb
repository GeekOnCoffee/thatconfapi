class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@thatconf.com',
          return_path: 'contact@thatconf.com'

  layout 'mailer'

  def email(to_address, subject, body)
    options = { to: to_address, subject: subject, body: body }
    mail options
  end

  def support_email(subject, body)
    email(ENV['SUPPORT_EMAIL'], subject, body)
  end
end
