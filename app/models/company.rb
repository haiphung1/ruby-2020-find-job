class Company < ApplicationRecord
  has_one :user
  has_many :views, as: :viewable, dependent: :destroy
end
