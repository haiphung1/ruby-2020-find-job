class Notification < ApplicationRecord
  belongs_to :creator, class_name: User.name, foreign_key: :creator_id
  belongs_to :receiver, class_name: User.name, foreign_key: :receiver_id
end
