class CreateSpreeWaitList < ActiveRecord::Migration
  def change
    create_table :spree_wait_lists do |t|
      t.boolean :notified, null: false, default: false
      t.integer :spree_user_id
      t.integer :variant_id
    end
  end
end
