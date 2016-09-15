require 'rails_helper'

describe CohortHelper do

  let(:cohort){Cohort.create(name: 'salamanders')}
  let(:round){Round.create}
  let(:user){User.create(first_name: 'bob', last_name: 'bob', email: 'bob@bob.bob', hashed_password: 'password', teacher: false, cohort: cohort, team: team)}
  let(:session) do
    session = Hash.new
    session[:user_id] = user.id
  end
  let(:project){project = Project.create(title: 'project1', description: 'This is my test project', cohort: cohort, team: team, originator: user)}

  describe "current cohort" do
    it 'identifies the current cohort' do
      expect(current_cohort).to eq(cohort)
    end
  end

  describe "mode vote value" do
    it 'finds the vote value with the highest frequency' do
      # expect(project.mode_vote_value).to eq 2
    end
  end

  describe "vote frequency" do
    it 'returns a collection of values by frequency' do
      # expect(project.vote_frequency).to eq({3=>5, 2=>7})
    end
  end

  describe "find vote values" do
    it 'returns an array of vote values' do
      # expect(project.find_vote_values).to eq([3,3,3,3,3,2,2,2,2,2,2,2])
    end
  end
end
