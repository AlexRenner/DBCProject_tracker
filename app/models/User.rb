class User < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :team
  has_many :projects
  has_many :votes
end
