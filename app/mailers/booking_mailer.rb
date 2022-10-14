class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_created.subject
  #
  def booking_created
    @user = params[:user]
    @booking_number = params[:booking_number]

    @greeting = "Hi, #{@user.first_name}"

    mail(
      from: "service-booking-app@example.com",
      to: @user.email,
      subject: "Booking Successfully Created"
    )
  end

  def booking_cancelled
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def booking_completed
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
