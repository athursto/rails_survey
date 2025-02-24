class Response < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :user_id, presence: true
end
