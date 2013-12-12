class AddNinjaToPerson < ActiveRecord::Migration
  def change
    add_column :people, :ninja, :boolean
  end
end
