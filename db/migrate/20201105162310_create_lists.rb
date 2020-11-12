class CreateLists < ActiveRecord::Migration[4.2]
  def change
    create_table :lists do |t|
      t.text :description
      t.integer :user_id
    end
  end
end
