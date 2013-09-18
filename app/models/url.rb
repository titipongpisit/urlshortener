class Url < ActiveRecord::Base

  validates :original_url, presence: true 

  def self.random 
    shortened = ""
    6.times do
    shortened << (('A'..'Z').to_a + ('0'..'9').to_a).sample
    end  
    shortened
  end 

end

