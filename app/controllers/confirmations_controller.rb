class ConfirmationsController < Devise::ConfirmationsController
  
  private
  def after_confirmations_path_for(resources_name, resource)
    sign-in(resource)
    shot_path
  end
end
