class Level < ActiveRecord::Base
  attr_accessible :answer, :next_id, :prev_id, :question
  before_answer :sterlize_answer

  validates :answer, :presence => true, :length => { :maximum => 70 }
  

  private

  def sterlize_answer
  	self.answer = self.answer.chomp.downcase.gsub(/[\W\s]/, '')
  end

end
