class UpdateColumnsForWaitLists < ActiveRecord::Migration
  def change
    remove_column :spree_simple_wait_lists, :user_id
    add_column :spree_simple_wait_lists, :email, :string, index: true

  end
end
