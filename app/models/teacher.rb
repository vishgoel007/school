class Teacher < User

  # can post many posts
  has_many :posts, dependent: :destroy , foreign_key: 'user_id'

  # can teach many grades
  has_many :user_grades, dependent: :destroy, foreign_key: 'user_id'
  has_many :grades , through: :user_grades



end