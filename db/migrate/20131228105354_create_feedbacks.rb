class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :subject
      t.string :message
      t.integer :person_id

      t.timestamps
    end
  end
end
