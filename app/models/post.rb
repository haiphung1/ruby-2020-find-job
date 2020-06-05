class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :skills, dependent: :destroy

  scope :by_created_at, ->{order created_at: :desc}
  enum target_type: {freelance: 0, parttime: 1, fulltime: 2}

  def apply_time
    [start_date, end_date].join(" - ")
  end
end
