class AddRegistrationCodeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :registration_code, :string, unique: true, null: false
  end
end
