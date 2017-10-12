class ChangeTypeToResourceType < ActiveRecord::Migration[5.0]
  def change
    rename_column :resources, :type, :resource_type
  end
end
