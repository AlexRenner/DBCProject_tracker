class Cohort < ActiveRecord::Base
  include CohortHelper

  has_many :students, class_name: 'User'
  has_many :projects
  has_many :votes, through: :students
  has_many :rounds
  has_many :teams, through: :students, source: :team

  validates :name, presence: true
end
