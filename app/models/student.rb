class Student < User


  # a student can only in particular grade
  has_one :user_grade , dependent: :destroy, foreign_key: 'user_id'
  has_one :grade , through: :user_grade

end