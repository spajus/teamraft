class AddDefaultValueToPersonAttributes < ActiveRecord::Migration
  def change
    change_column :person_attributes, :value, :string, null: true
  end
end
