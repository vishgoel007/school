class Admin < User

  # can post many posts
  has_many :posts, dependent: :destroy , foreign_key: 'user_id'

  # admin post can have many tags
  has_many :post_tags, dependent: :destroy, foreign_key: 'user_id'
  has_many :tags , through: :post_tags

  # can have many grades to see other grades posts
  has_many :user_grades, foreign_key: 'user_id'
  has_many :grades, through: :user_grades

end