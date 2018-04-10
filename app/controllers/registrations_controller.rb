class RegistrationsController < Devise::RegistrationsController

def create
    super

    if user_signed_in?
      current_user.add_role ((current_user.type).to_sym)
    end

  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :type)
  end

end