class HWSubmission < ActiveRecord::Base
  belongs_to :student
  belongs_to :homework
  has_many :questionsubmissions

  validates :student, presence: true
  validates :homework, presence: true
end
