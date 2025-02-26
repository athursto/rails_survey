class Survey < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :questions, through: :sections
end
