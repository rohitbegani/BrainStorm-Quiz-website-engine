class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.text :answer
      t.integer :next_id
      t.integer :prev_id
      t.text :question

      t.timestamps
    end
  end
end
