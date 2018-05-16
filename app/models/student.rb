class Student < User


  # a student can only in particular grade
  has_one :user_grade , dependent: :destroy, foreign_key: 'user_id'
  has_one :grade , through: :user_grade

  def student_grade_posts
    get_grade_posts(self.grade.cls)
  end

  def student_bookmarked_posts
    posts = []
    self.bookmarks.pluck(:post_id).each do |id|
      posts << Post.find(id)
    end

    posts
  end

end