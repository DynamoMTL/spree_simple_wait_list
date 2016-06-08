class AddUniqueIndexToWaitLists < ActiveRecord::Migration
  def change
    add_index :spree_wait_lists, [:spree_user_id, :variant_id], unique: true
  end
end
