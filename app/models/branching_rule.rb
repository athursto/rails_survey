
class BranchingRule < ApplicationRecord
  belongs_to :question
  belongs_to :next_section, class_name: "Section", optional: true
end
