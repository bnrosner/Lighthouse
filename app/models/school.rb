class School < ActiveRecord::Base
  has_many :persons
  has_many :classes
end
