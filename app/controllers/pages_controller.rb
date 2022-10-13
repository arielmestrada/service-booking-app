class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:overview]

  def home
  end

  def overview
    @count = Hash.new
    Booking.all.each do |booking|
      if @count.include?(booking.service_name)
        @count[booking.service_name] += 1
      else
        @count[booking.service_name] = 1
      end
    end
    @most_booked_service = @count.max_by { |k, v| v }[0]
    @users = User.all
    @bookings = Booking.all
  end

end
