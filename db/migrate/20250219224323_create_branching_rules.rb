class CreateBranchingRules < ActiveRecord::Migration[8.0]
  def change
    create_table :branching_rules do |t|
      t.references :question, null: false, foreign_key: true
      t.string :answer
      t.integer :next_section_id

      t.timestamps
    end
  end
end
