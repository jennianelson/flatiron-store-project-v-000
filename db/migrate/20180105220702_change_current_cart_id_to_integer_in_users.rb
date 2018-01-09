class ChangeCurrentCartIdToIntegerInUsers < ActiveRecord::Migration
  def change
    change_column :users, :current_cart_id, :integer
  end
end
