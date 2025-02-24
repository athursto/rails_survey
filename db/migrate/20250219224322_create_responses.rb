class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :user_id
      t.string :answer

      t.timestamps
    end
  end
end
