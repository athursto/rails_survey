class ChangeQuestionTypeToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :question_type, :string
    add_column :questions, :question_type, :integer, default: 0, null: false
  end
end
