class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id,   null: false
      t.string :answer_text, null: false
      t.integer :total_count, null: false, default: 0

      t.timestamps
    end
    add_index :answers, :question_id
  end
end
