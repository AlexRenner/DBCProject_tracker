class Vote < ActiveRecord::Base
 belongs_to :round
 belongs_to :voter, class_name: 'User'
 belongs_to :project
end
