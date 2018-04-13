class Post < ApplicationRecord
  resourcify

  belongs_to :teacher, class_name: 'Teacher', foreign_key: 'user_id'
  belongs_to :admin, class_name: 'Admin', foreign_key: 'user_id'
  belongs_to :user

  has_many :post_tags
  has_many :tags, through: :post_tags

  # a post can only be in single grade
  has_one :post_grade, dependent: :destroy
  has_one :grade, through: :post_grade



end
