class Round < ActiveRecord::Base
  belongs_to :cohort
  has_many :votes
  has_many :students, through: :votes, class_name: 'User'

  after_save do
    users = User.all.where(cohort: self.cohort)
    # TODO add additional filter for project status
    projects = Project.all.where(cohort: self.cohort)

    users.each do |user|
      projects.each do |project|
        self.votes << Vote.create(voter: user, project: project, value: 0)
      end
    end
  end
end
