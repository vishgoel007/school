class RegistrationsController < Devise::RegistrationsController

  def create
    super

    current_user.add_role(params[:user][:roles].to_sym)

  end

end