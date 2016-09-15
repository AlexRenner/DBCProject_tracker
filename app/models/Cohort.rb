class Cohort < ActiveRecord::Base
  has_many :students, class_name: 'User'
  has_many :projects
  has_many :votes, through: :students
  has_many :rounds, through: :votes, source: :round
end
