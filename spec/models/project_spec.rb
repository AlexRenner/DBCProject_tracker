require 'rails_helper'

describe Project do

  before(:example) do
      5.times{Vote.create(voter: user, project: project, round: round, value: 3)}
      7.times{Vote.create(voter: user, project: project, round: round, value: 2)}
  end

  let(:cohort){Cohort.create(name: 'salamanders')}
  let(:team){Team.create(name: 'TBD')}
  let(:round){Round.create}
  let(:user){User.create(first_name: 'bob', last_name: 'bob', email: 'bob@bob.bob', hashed_password: 'password', teacher: false, cohort: cohort, team: team)}
  let(:project){project = Project.create(title: 'project1', description: 'asdkfdsa dsf fas fas sfa fdsa fas', cohort: cohort, team: team, originator: user)}

  describe "mean vote value" do
    it 'calculates the average of all vote values for a project' do
      expect(project.mean_vote_value).to eq 2.42
    end
  end

  describe "mode vote value" do
    it 'finds the vote value with the highest frequency' do
      expect(project.mode_vote_value).to eq 2
    end
  end

  describe "vote frequency" do
    it 'returns a collection of values by frequency' do
      expect(project.vote_frequency).to eq({3=>5, 2=>7})
    end
  end

  describe "find vote values" do
    it 'returns an array of vote values' do
      expect(project.find_vote_values).to eq([3,3,3,3,3,2,2,2,2,2,2,2])
    end
  end
end
