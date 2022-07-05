class ApplicationController < ActionController::Base

    # Add sign up params
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    
    #After sign in
    def after_sign_in_path_for(resource)
      if user_signed_in?
        feed_path
      end
    end
    
    def after_sign_up_path_for(resource)
      if user_signed_in?
        feed_path
      end
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
      #sign_up_params = [ :first_name, :last_name, :full_name, :matricule, :level_name,
      #:material_name, :school_name, :contact, :city_name, :status, :email,
    #                 :password, :slug, :gender, :payment, :terms, :avatar_profil, :referral_in, :referral_out]
                                
    #update_params  = [ :school_name, :status, :avatar_profil, :status_payment]
     
    sign_up_params = [ :first_name, :last_name, :full_name, :contact, :status, :email, :password,
                        :city_name, :school_name, :level_name, :matricule, :gender, :slug]
      devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end 
end
