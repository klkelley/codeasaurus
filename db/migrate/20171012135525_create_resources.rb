class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :type
      t.integer :teacher_id
      t.timestamps
    end

    add_foreign_key :resources, :users, column: :teacher_id
  end
end
