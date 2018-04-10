class UserGrade < ApplicationRecord

  belongs_to :grade, optional: true
  belongs_to :admin, optional: true, class_name: 'Admin', foreign_key: 'user_id'
  belongs_to :teacher, optional: true, class_name: 'Teacher', foreign_key: 'user_id'
  belongs_to :student, optional: true, class_name: 'Student', foreign_key: 'user_id'
  belongs_to :guardian, optional: true, class_name: 'Guardian', foreign_key: 'user_id'


end
