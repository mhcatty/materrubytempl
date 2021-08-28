class ReportMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.report_mailer.daily.subject

  # Daily email for 2 example accounts + 'others' analytics.
  # Run daily with Heroku Scheduler:  $ ReportMailer.daily.deliver_now
  def daily
    # @email = ENV["GMAIL_USERNAME"]
    @user = User.with_role(:sysadmin)
                .pluck(:email)
                .first

    @superadmin_one_visits = Ahoy::Visit.daily
                                        .where(user_id: 17)

    @member_one_visits = Ahoy::Visit.daily
                                    .where(user_id: 13)

    @other_visits = Ahoy::Visit.daily
                               .where.not('email LIKE ?', "%@example.com%")

    mail to: @user
    # mail to: @email #"to@example.org"
  end

end