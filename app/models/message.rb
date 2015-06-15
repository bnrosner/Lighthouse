class Message < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :student

  validates :body, presence: true
end