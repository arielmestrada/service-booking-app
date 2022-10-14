class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:overview]

  def home
  end

  def overview
    authorize! :manage, :all
    @count = Hash.new
    Booking.all.each do |booking|
      if @count.include?(booking.service_name)
        @count[booking.service_name] += 1
      else
        @count[booking.service_name] = 1
      end
    end

    if @count.empty?
      @most_booked_service = "None"
    else
      @most_booked_service = @count.max_by { |k, v| v }.first
    end
    
    @users = User.customers
    @bookings = Booking.all
  end

end
