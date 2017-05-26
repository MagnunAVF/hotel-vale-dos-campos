class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :cpf, limit: 15
      t.string :address
      t.date :birthday
      t.string :email
      t.integer :fone, limit: 15

      t.timestamps
    end
  end
end
