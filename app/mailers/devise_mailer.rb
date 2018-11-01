class DeviseMailer < Devise::Mailer
  default from: 'no-reply@jobbyjobjob.net'
  layout 'mailer'

  def confirmation_instructions(record, token, opts={})
    mail         = super
    mail.subject = subject_formatted(I18n.t('devise.mailer.confirmation_instructions.subject'))
    mail
  end

  def reset_password_instructions(record, token, opts={})
    mail         = super
    mail.subject = subject_formatted(I18n.t('devise.mailer.reset_password_instructions.subject'))
    mail
  end

  def unlock_instructions(record, token, opts={})
    mail         = super
    mail.subject = subject_formatted(I18n.t('devise.mailer.unlock_instructions.subject'))
    mail
  end

  def email_changed(record, token, opts={})
    mail         = super
    mail.subject = subject_formatted(I18n.t('devise.mailer.email_changed.subject'))
    mail
  end

  def password_change(record, token, opts={})
    mail         = super
    mail.subject = subject_formatted(I18n.t('devise.mailer.password_change.subject'))
    mail
  end

  def subject_formatted(subject)
    "JobbyJobJob: #{subject}"
  end
end
