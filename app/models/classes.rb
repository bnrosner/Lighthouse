class Classes < ActiveRecord::Base
  belongs_to :school
  belongs_to :term
  has_many :tutors
  has_many :students
end
