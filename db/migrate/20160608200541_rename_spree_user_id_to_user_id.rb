class RenameSpreeUserIdToUserId < ActiveRecord::Migration
  def change
    rename_column :spree_simple_wait_lists, :spree_user_id, :user_id
  end
end
