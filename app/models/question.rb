class Question < ApplicationRecord
  belongs_to :section
  has_many :responses, dependent: :destroy
  has_many :branching_rules, dependent: :destroy
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, allow_destroy: true

  enum :question_type, { text: 0, multiple_choice: 1, checkbox: 2, date: 3, info: 4 }
end
