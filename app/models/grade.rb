class Grade < ApplicationRecord

  has_many :categories, dependent: :destroy
  has_many :teachers, through: :categories

end
