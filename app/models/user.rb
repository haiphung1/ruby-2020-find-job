class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  
  has_one :company, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :user_applies

  delegate :name, :logo, to: :company, prefix: true

  validates :username, presence: true, length: {maximum: Settings.validation.max_length}

  enum role: {user: 1, admin: 2}
end
