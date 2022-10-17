class ApplicationController < ActionController::Base

    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    def after_sign_in_path_for(resource)
    #   home_index_path
    end
  
    def after_sign_out_path_for(resource)
      user_session_path
    end
  
    protected
  
    def configure_permitted_parameters
      # サインアップ時にnameとphone_numberのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # 情報更新時にnicknameの取得を許可
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  
  end