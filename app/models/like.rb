class Like < ApplicationRecord
  belongs_to :bird
  belongs_to :user

  validates :bird_id, presence: true
  validates :user_id, presence: true
end
