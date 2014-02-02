class Level < ActiveRecord::Base
  attr_accessible :answer, :next_id, :prev_id, :question
  #before_answer :sterlize_answer

  validates :answer, :presence => true, :length => { :maximum => 70 }

  def self.set(params)
    next_id = nil
    prev_id = (Level.last and Level.last.id) ? Level.last.id : nil
    params[:prev_id] = prev_id
    level = Level.new(params)
    level
  end
  

  private

  def sterlize_answer
  	self.answer = self.answer.chomp.downcase.gsub(/[\W\s]/, '')
  end

end
