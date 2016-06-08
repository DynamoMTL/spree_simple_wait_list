class RenameSpreeWaitListToSpreeSimpleWaitList < ActiveRecord::Migration
  def change
    rename_table :spree_wait_lists, :spree_simple_wait_lists
  end
end
