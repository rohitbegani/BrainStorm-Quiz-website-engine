class Attempt < ActiveRecord::Base
  attr_accessible :attempt, :level_id, :user_id


  belongs_to :user
  belongs_to :level


end
