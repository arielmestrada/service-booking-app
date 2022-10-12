class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_number, :street, :village, :city, :province, :postal_code])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :contact_number, :street, :village, :city, :province, :postal_code])
    end

    def after_sign_in_path_for(resource)
        if current_user.is_admin
            overview_path
        else
            services_path
        end
    end
end
