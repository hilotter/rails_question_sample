class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title,              null: false
      t.string :image
      t.datetime :publish_datetime

      t.timestamps
    end

    add_index :questions, :publish_datetime
  end
end
