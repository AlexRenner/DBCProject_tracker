class Round < ActiveRecord::Base
  has_many :votes
  has_many :students, through: :votes, class_name: 'User'
  belongs_to :cohort
end
