class Post < ApplicationRecord
  resourcify

  belongs_to :teacher, optional: true, class_name: 'Teacher', foreign_key: 'user_id'
  belongs_to :admin, optional: true, class_name: 'Admin', foreign_key: 'user_id'
  belongs_to :user, optional: true

  # a post can only be in single grade
  has_one :post_grade, dependent: :destroy
  has_one :grade, through: :post_grade

end
