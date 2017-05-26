class CreateHotelinformations < ActiveRecord::Migration[5.0]
  def change
    create_table :hotelinformations do |t|
      t.string :description
      t.string :email
      t.string :fone
      t.string :address

      t.timestamps
    end
  end
end
