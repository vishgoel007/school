class Post < ApplicationRecord
  # resourcify

  belongs_to :teacher, optional: true, class_name: 'Teacher', foreign_key: 'user_id'
  belongs_to :admin, optional: true, class_name: 'Admin', foreign_key: 'user_id'
  belongs_to :user, optional: true

  # a post can only be in single grade
  belongs_to :grade, optional: true

  belongs_to :bookmark, optional: true

  def bookmark_status(user)
    user.bookmarks.each do |bookmark|
      if bookmark.post_id == self.id
        return 'Remove as bookmark'
      end
    end
    'Add as bookmark'

  end

end
