class Qualification < ApplicationRecord
  belongs_to :profile

  def qualification_time
    [start_time, end_time].join(" - ")
  end
end  
