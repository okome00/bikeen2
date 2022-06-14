class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? ## devise機能を実行する前に、configure_permitted_parametersメソッドを実行

  def after_sign_in_path_for(resource) ## Sign up後遷移先
    user_path(current_user.id) ## my profileへ変更
  end

  def after_sign_in_path_for(resource) ## Sign in後の遷移先
    posts_path
  end

  def after_sign_out_path_for(resource) ## Sign out後の遷移先
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bike_model, :residence]) ## 保存情報の許可
  end

end
