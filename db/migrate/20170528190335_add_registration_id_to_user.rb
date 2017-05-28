class AddRegistrationIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :registrationID, :string
  end
end
