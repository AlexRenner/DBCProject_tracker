class Cohort < ActiveRecord::Base
  has_many :students, class_name: 'User'
  has_many :projects
end
