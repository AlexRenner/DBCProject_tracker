class Project < ActiveRecord::Base
  belongs_to :team
  belongs_to :cohort
  belongs_to :originator, class_name: 'User', foreign_key: :user_id
  has_many :votes
end
