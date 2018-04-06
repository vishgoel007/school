class RegistrationsController < Devise::RegistrationsController
# before_action :check_role, only: [:create]

def create
    super

    current_user.add_role(params[:user][:roles].to_sym)

  end

  # private
  #
  # def check_role
  #   if params[:user][:roles] == ""
  #     redirect_to '/users/sign_up' , alert: 'Must select any role for successful sign up'
  #   end
  # end

end