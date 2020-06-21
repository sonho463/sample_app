class AddDefaultActivationToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :activated, false
  end
end
