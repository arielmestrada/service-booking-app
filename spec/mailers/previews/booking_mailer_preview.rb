# Preview all emails at http://localhost:3000/rails/mailers/booking_mailer
class BookingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/booking_mailer/booking_created
  def booking_created
    @user = User.first
    @booking_number = Booking.first.booking_number
    BookingMailer.with(user: @user, booking_number: @booking_number).booking_created
  end

end
