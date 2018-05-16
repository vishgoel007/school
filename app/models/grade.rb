class Grade < ApplicationRecord

  has_many :user_grades, dependent: :destroy
  # grade can have many admins
  has_many :admins, through: :user_grades

  # grade can have many teachers
  has_many :teachers, through: :user_grades

  # grade can have many students
  has_many :students , through: :user_grades

  # grade can have only many parents
  has_many :guardians, through: :user_grades

  # can have many posts
  has_many :posts, dependent: :destroy

  validates_presence_of :cls



end
