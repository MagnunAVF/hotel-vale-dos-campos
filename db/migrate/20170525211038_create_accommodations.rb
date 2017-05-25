class CreateAccommodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations do |t|
      t.integer :number
      t.integer :capacity
      t.float :price

      t.timestamps
    end
  end
end
