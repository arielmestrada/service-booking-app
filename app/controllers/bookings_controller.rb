class BookingsController < ApplicationController
    before_action :authenticate_user!

    def new
        @service = Service.find(params[:service_id])
        @booking = Booking.new
    end

    def confirmation
    end

    def create
        @order_number = rand(100000..199999)
        @order_date = DateTime.now.strftime("%A, %B %d %Y, %I:%M%p")
        if params[:payment].empty?
            @payment = "Pay at store"
        else
            @option = current_user.payment_options.find(params[:payment])
            @payment = "#{@option.card_type} - #{@option.card_number}"
        end

        # Create booking number as ref for user
        current_user.booking_numbers.create(
            number: @order_number
        )

        # Create booking
        Booking.create(
            booking_number: @order_number,       
            date_booked: @order_date,
            email: params[:email],
            first_name: params[:first_name],
            last_name: params[:last_name],
            contact_number: params[:contact_number],       
            street: params[:street],
            village: params[:village],
            city: params[:city],
            province: params[:province],
            postal_code: params[:postal_code],
            service_name: params[:service_name],
            service_price: params[:service_price],
            scheduled_date: params[:scheduled_date],
            scheduled_time: params[:scheduled_time],
            amount: params[:service_price],
            status: "pending",
            payment: @payment
        )

        redirect_to "/services"
    end
    
end
