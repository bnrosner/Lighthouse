class Student < ActiveRecord::Base
  belongs_to :person
  belongs_to :classes
end
