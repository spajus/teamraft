class AddIconToAttributeType < ActiveRecord::Migration
  def change
    add_column :attribute_types, :icon, :string
  end
end
