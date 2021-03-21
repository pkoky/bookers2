class ApplicationController < ActionController::Base
    # application_controllerは全てのページに適用
    # ログインしていないユーザーを弾く。[　]内は適用を外すアクション名　
   before_action :authenticate_user!,except: [:top,:about]
    # devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
   before_action :configure_permitted_parameters, if: :devise_controller?
   
  # sign_in後の遷移先の指定
   def after_sign_in_path_for(resource)
     user_path(current_user)
   end 
   
   
  protected
  # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
  # 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
  # privateは、自分のコントローラ内でしか参照できません。一方、protectedは呼び出された他のコントローラからも参照できます。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
end
