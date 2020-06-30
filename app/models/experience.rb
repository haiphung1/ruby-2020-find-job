class Experience < ApplicationRecord
  belongs_to :profile

  validates :title, length: {maximum: Settings.validation.max_length}
  
end
