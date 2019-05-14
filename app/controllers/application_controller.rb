class ApplicationController < ActionController::Base
   Refile.secret_key = '3aa4e7850d7fa8c66e21f82e3410c636538c97a20c66c6ebc4dabd4c84be636e35db03688eea7636d9de25e38da23f94f714973e0d1ae610c8bb2919c8e6b589'

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
    "/stores"
    end

    def after_sign_out_path_for(resource)
     "/stores"

    end

  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end


end


