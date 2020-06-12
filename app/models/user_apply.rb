class UserApply < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum status: {pending: 0, approved: 1}

  scope :post_applies, -> posts_id {where post_id: posts_id}

  delegate :title, to: :post, prefix: true
  delegate :username, to: :user, prefix: true
end
