class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :type

  scope :admins, -> { where(type: 'Admin') }
  scope :teachers, -> { where(type: 'Teacher') }
  scope :students, -> { where(type: 'Student') }
  scope :guardians, -> { where(type: 'Guardian') }

  has_many :posts, dependent: :destroy


end
