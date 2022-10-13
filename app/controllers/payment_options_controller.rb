class PaymentOptionsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_user, :get_payment_options
    before_action :ensure_frame_response, only: [:new]

    def index
    end

    def new
        @payment_option = @payment_options.new
    end

    def create
        @payment_option = @payment_options.create(payment_option_params)
        redirect_to user_payment_options_path
    end

    def destroy
        @payment_option = @payment_options.find(params[:id])
    end

    private

    def get_user
        @user = current_user
    end

    def get_payment_options
        @payment_options = @user.payment_options
    end

    def payment_option_params
        params.require(:payment_option).permit(:card_number, :card_type, :expiry_date, :registered_name)
    end

    def ensure_frame_response
        redirect_to root_path unless turbo_frame_request?
    end

end
