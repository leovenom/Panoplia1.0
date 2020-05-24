# https://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html
class RegistrationsController < Devise::RegistrationsController



  def after_update_path_for(user)
    user_path(@user)
  end

 private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :entity)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :username, :location, :bio, :art, :available, :avatar)
  end

end