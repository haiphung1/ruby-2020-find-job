class Profile < ApplicationRecord
  belongs_to :user
  has_many :skills, as: :skillable, dependent: :destroy
  has_many :views, as: :viewable, dependent: :destroy
  has_many :experiences, dependent: :destroy

  delegate :username, to: :user, prefix: true

  enum status: {private_cv: 0, public_cv: 1}
end
