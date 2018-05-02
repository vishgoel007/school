class Teacher < User

  # can post many posts
  has_many :posts, dependent: :destroy , foreign_key: 'user_id'

  # can teach many grades
  has_many :user_grades, dependent: :destroy, foreign_key: 'user_id'
  has_many :grades , through: :user_grades

  def get_posts(cls)
    post = []
    Grade.where(cls: cls).each do |g|
      post << g.posts
    end
    post
  end

  def all_posts(user)
    user_grades = user.grades.pluck(:cls)
    all_user_grades_posts = Hash.new{|h,k| h[k] = [] }

    user_grades.each do |grade|
        post = get_posts(grade)
        all_user_grades_posts[grade].push(post)
    end
    all_user_grades_posts
  end


end