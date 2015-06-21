class QuestionSubmission < ActiveRecord::Base
  belongs_to :hwsubmission

  validates :hwsubmission, presence: true
  validates :completed, presence: true
end
