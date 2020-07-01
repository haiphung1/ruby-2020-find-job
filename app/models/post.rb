class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :skills, as: :skillable, dependent: :destroy
  has_many :user_applies, dependent: :destroy

  delegate :title, to: :category, prefix: true
  delegate :company_logo, :company_name, to: :user

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

  enum target_type: {freelance: 0, parttime: 1, fulltime: 2}

  validates :title, presence: true, length: {maximum: Settings.validation.title_max}
  validates :description, presence: true, length: {maximum: Settings.validation.description_max}
  validates :salary, presence: true
  validates :address, presence: true, length: {maximum: Settings.validation.address_max}
  validate :end_date_is_after_start_date

  validates :target_type, :start_date, :end_date, presence: true


  POST_PARAMS = [:category_id, :title, :description, :salary, :address,
                 :target_type, :start_date, :end_date,
                 skills_attributes: [:id, :title, :_destroy]].freeze

  def apply_time
    [start_date, end_date].join(" - ")
  end

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?
  
    if end_date < start_date
      errors.add(:end_date, "không được nhỏ hơn start_date") 
    end 
  end
end
