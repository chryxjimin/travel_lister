class CreateTravelListers < ActiveRecord::Migration
  def change
    create_table :travel_listers do |t|
      t.text :description
      t.integer :user_id
    end
  end
end
