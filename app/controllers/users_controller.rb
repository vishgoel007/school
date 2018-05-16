class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @grade_list = %w[1 2 3 4 5 6 7 8 9 10 11 12]

  end

  def update
    role = current_user.type.downcase.to_sym
    current_user.update(

        email: params[role][:email],
        avatar: params[role][:avatar]
    )
    redirect_to action: 'profile'

  end

end

