class Course < ActiveRecord::Base
  belongs_to :school
  has_many :homeworks
  has_many :students

  validates :name, presence: true
  validates :school, presence: true
end
