require 'bcrypt'
class User < ActiveRecord::Base
  belongs_to :cohort, required: false
  belongs_to :team, required: false
  has_many :projects
  has_many :votes

  validates :email, :presence => true, :uniqueness => true
  validates :first_name, :last_name, :password_hash, :presence => true


  def make_teacher
    self.update(teacher: true)
  end

  def has_voted?(project, round)
    votes = self.votes.find_by(project: project, round: round)
    votes && votes.value != 0
  end

  def password
	@password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
  	@password = BCrypt::Password.create(new_password)
  	self.password_hash = @password
  end

  def self.authenticate(email, pass)
  	user_login = User.find_by(email: email) #returns user
  	if user_login && user_login.password == pass
  		return user_login
  	end
	  nil
  end
end
