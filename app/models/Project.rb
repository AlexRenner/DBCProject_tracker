class Project < ActiveRecord::Base
  belongs_to :team, required: false
  belongs_to :cohort
  belongs_to :originator, class_name: 'User', foreign_key: :user_id
  has_many :votes

  validates :title, presence: true, uniqueness: true
  validates :description, :cohort_id, :user_id, presence: true

  def mean_vote_value
    all_votes = self.votes.where.not(value: 0)
    if !all_votes.empty?
      avg = (all_votes.map { |vote| vote[:value].to_f }.reduce(:+) / all_votes.length).round(2)
    end
  end

  def find_vote_values
    vote_value_array = Array.new
    all_votes = self.votes.where.not(value: 0)

    all_votes.each do |vote|
      vote_value_array << vote[:value]
    end

    vote_value_array
  end

  def vote_frequency
    find_vote_values.inject(Hash.new(0)) { |hash,value| hash[value] += 1; hash }
  end

  def mode_vote_value
    find_vote_values.max_by { |v| vote_frequency[v] }
  end

end
