class AddGradeIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :grade_id, :integer
  end
end
