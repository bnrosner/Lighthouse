class Homework < ActiveRecord::Base
  belongs_to :course
  has_many :questions
  has_many :hwsubmissions

  validates :name, presence: true
  validates :course, presence: true
  validates :num_questions, presence: true
end
