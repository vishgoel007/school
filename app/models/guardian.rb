class Guardian < User

  # parents can have many children in different classes
  has_many :user_grades, dependent: :destroy, foreign_key: 'user_id'
  has_many :grades, through: :user_grades


end