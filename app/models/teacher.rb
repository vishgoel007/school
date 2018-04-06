class Teacher < User

  has_many :categories, dependent: :destroy
  has_many :grades, through: :categories

end