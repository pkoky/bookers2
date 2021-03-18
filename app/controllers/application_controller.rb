class ApplicationController < ActionController::Base
    # application_controllerは全てのページに適用
    # ログインしていないユーザーを弾く[　]内は適用を外すアクション名　
   before_action :authenticate_user!,except: [:top,:about]
  
   before_action :configure_permitted_parameters, if: :devise_controller?
   
   def after_sign_in_path_for(resource)
     books_path
   end 
   
   
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
end
