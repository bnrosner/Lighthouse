class Review < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :user
  validates :tutor, presence: true
  validates :user, presence: true
  validates :rating, presence: true
  validates :body, presence: true
end