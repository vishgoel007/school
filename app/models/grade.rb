class Grade < ApplicationRecord

  has_many :user_grades, dependent: :destroy
  # grade can have many admins
  has_many :admins, through: :user_grades

  # grade can have many teachers
  has_many :teachers, through: :user_grades

  # grade can have many students
  has_many :students , through: :user_grades

  # grade can have only one parent
  has_one :user_grade, dependent: :destroy
  has_one :guardian, through: :user_grade

  # can have many posts
  has_many :post_grades, dependent: :destroy
  has_many :posts, through: :post_grades

end
