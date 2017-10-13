class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :body
      t.boolean :resolved
      t.integer :resource_id
    end
    add_foreign_key :issues, :resources
  end
end
