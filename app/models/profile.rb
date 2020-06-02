class Profile < ApplicationRecord
  belongs_to :user
  has_many :skills, dependent: :destroy
  has_many :views, as: :viewable, dependent: :destroy
  has_many :experiences, dependent: :destroy
end
