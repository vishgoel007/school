class User < ApplicationRecord
  rolify
  attr_accessor :std
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  validates_presence_of :type
  validates_presence_of :std , allow_blank: false , if: -> { type == 'Student' },
                         message: 'Student must add grade to continue'



  scope :admins, -> { where(type: 'Admin') }
  scope :teachers, -> { where(type: 'Teacher') }
  scope :students, -> { where(type: 'Student') }
  scope :guardians, -> { where(type: 'Guardian') }

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def get_grade_posts(cls)
    post = []
    Grade.where(cls: cls).each do |g|
      unless g.posts.empty?
        post << g.posts
      end
    end
    post
  end

  def user_all_grade_posts # for teachers,admins,guardians
    user_grades = self.grades.pluck(:cls)
    all_user_grades_posts = Hash.new{|h,k| h[k] = [] }

    user_grades.each do |grade|
      post = get_grade_posts(grade)
      all_user_grades_posts[grade].push(post)
    end
    all_user_grades_posts
  end


  def grade_status(grade)
    if self.grades.pluck(:cls).include? grade.to_i
      return 'Delete grade'
    end
    'Add grade'
  end




end
