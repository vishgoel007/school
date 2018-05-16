class GradesController < ApplicationController
  before_action :authenticate_user!

  def toggle_grade
    grade = current_user.grades.find_by(cls: params[:grade])
    if grade.blank?
      current_user.grades.create(cls: params[:grade])
    else
      grade.destroy
    end
    redirect_to  '/users/profile'
  end

end

