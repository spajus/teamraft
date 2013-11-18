class CreateAttributeTypes < ActiveRecord::Migration
  def change
    create_table :attribute_types do |t|

      t.integer :company_id, null: false
      t.string :attribute_name, null: false
      t.string :attribute_type, null: false
      t.string :description
      t.boolean :deleted, default: false
      t.boolean :required, default: false
      t.integer :sort_order

      t.timestamps
    end
  end
end
