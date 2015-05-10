class Person < ActiveRecord::Base
  belongs_to :school
  has_many :tutors
  has_many :students
end
