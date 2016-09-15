class Round < ActiveRecord::Base
  belongs_to :cohort
  has_many :votes
  has_many :students, through: :votes, class_name: 'User'
end
