class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if params[:user][:type] == 'Student' and user_signed_in?
      current_user.grade = Grade.new({cls: params[:user][:std].to_i})
      current_user.save
    end

  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :type, :std)
  end

end