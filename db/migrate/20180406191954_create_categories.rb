class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :grade_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
