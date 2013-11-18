class CreatePersonAttributes < ActiveRecord::Migration
  def change
    create_table :person_attributes do |t|
      t.integer :attribute_type_id, null: false
      t.integer :person_id, null: false
      t.string :value, null: false
      t.boolean :deleted, default: false

      t.timestamps
    end
  end
end
