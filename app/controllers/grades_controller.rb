class GradesController < ApplicationController
  before_action :authenticate_user!

  def add_grade
    current_user.grades.create(cls: params[:grade])
    redirect_to  '/users/profile'

  end

  def remove_grade
    current_user.grades.find_by(cls: params[:grade]).destroy
    redirect_to '/users/profile'
  end


end

