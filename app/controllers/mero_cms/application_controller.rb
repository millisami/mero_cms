module MeroCms
  class ApplicationController < ::ActionController::Base
    
    def current_mero_cms_user
      binding.pry
      send(:current_user)
    end
    
    helper_method :current_mero_cms_user
    
    def authenticate_and_authorize_mero_cms_user!
      if !current_mero_cms_user
        flash[:alert] = "You must be authenticated before you can do that."
        redirect_to main_app.send(MeroCms::Engine.login_url) and return
      end
      
      unless current_mero_cms_user.can_manage_mero_cms
        flash[:alert] = "You must be authorized before you can do that."
        redirect_to main_app.send(MeroCms::Engine.unauthorized_url) and return
      end
      
    end
  end
end
