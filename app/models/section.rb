class Section < ApplicationRecord
  belongs_to :survey
  has_many :questions, dependent: :destroy
  validates :position, presence: true, uniqueness: { scope: :survey_id }
  default_scope { order(:position) }
end
