class CreatePostGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :post_grades do |t|
      t.integer :post_id
      t.integer :grade_id

      t.timestamps
    end
  end
end
