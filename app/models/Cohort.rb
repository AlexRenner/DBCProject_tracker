class Cohort < ActiveRecord::Base
  has_many :students, class_name: 'User'
  has_one :project
end
