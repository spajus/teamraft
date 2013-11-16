class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :logo
      t.text :about

      t.boolean :allow_signup, default: true
      t.boolean :auto_approve, default: true

      t.timestamps
    end
  end
end
