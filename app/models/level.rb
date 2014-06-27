
class Level < ActiveRecord::Base
  attr_accessible :answer, :next_id, :prev_id, :question, :image
  before_save :sterlize_answer
  mount_uploader :image, ImageUploader

  has_many :attempts

  validates :answer , :presence => true, :length => {:maximum => 50}

 


  def self.set(params)
    next_id = nil
    prev_id = (Level.last and Level.last.id) ? Level.last.id : nil
    params[:prev_id] = prev_id
    level = Level.new(params)
    level
  end

  def sterlize_answer
    self.answer = self.answer.chomp.downcase.gsub(/[\W\n\s]/,'')
  end
end
