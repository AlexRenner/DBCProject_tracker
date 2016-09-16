class Team < ActiveRecord::Base
  has_many :students, class_name: 'User', foreign_key: :team_id
  has_one :project

  validates :name, presence: true
end
