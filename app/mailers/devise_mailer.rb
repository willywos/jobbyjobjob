class DeviseMailer < Devise::Mailer
  default from: 'no-reply@jobbyjobjob.net'
  layout 'mailer'
end
