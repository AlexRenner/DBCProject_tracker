require 'rails_helper'

describe CohortHelper do

  before(:example) do
    @request.session[:user_id] = user.id
  end

  let!(:cohort){Cohort.create(name: 'salamanders')}
  let!(:round){Round.create(cohort: cohort)}
  let!(:user){User.create(first_name: 'bob', last_name: 'bob', email: 'bob@bob.bob', password: 'password', teacher: false, cohort: cohort)}
  let!(:project){project = Project.create(title: 'project1', description: 'This is my test project', cohort: cohort, originator: user)}

  describe "current cohort" do
    it 'identifies the current cohort' do
      expect(current_cohort).to eq(cohort)
    end
  end

  describe "latest round" do
    it 'identifies the latest round of voting' do
      expect(latest_round).to eq(round)
    end
  end

  describe "votable?" do
    it 'returns true if current round is votable' do
      latest_round.votable = true
      expect(votable?).to eq(true)
    end

    it 'returns false if current round is not votable' do
      expect(votable?).to eq(false)
    end
  end

  describe "pitchable?" do
    it 'returns true if current cohort is recieving project pitches' do
      current_cohort.pitchable = true
      expect(pitchable?).to eq(true)
    end

    it 'returns false if current cohort is not recieving project pitches' do
      expect(pitchable?).to eq(false)
    end
  end
end
