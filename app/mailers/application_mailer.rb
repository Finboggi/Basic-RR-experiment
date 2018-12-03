# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  private

  def default_url_options
    Rails.application.config.action_mailer.default_url_options
  end

  # Add mailers. prefix to scope
  def default_i18n_subject(interpolations = {})
    I18n.t(:subject, interpolations.merge(i18n_default_params))
  end

  def i18n_mailer_scope
    self.class.mailer_name.tr('/', '.')
  end

  def i18n_default_params
    {
      scope: [:mailers, i18n_mailer_scope, action_name],
      default: action_name.humanize
    }
  end
end
