class PostTag < ApplicationRecord

  belongs_to :post
  belongs_to :tag
  belongs_to :admin
  belongs_to :teacher

end
