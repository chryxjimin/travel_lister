class CreateTravelEssentials < ActiveRecord::Migration[4.2]
  def change
    create_table :travel_essentials do |t|
      t.text :description
      t.integer :user_id
    end
  end
end
