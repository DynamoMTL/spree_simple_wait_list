require 'spree_core'
require 'spree_simple_wait_list/engine'

module SimpleWaitList
  def self.add(spree_user: user, spree_variant: variant)
    Spree::SimpleWaitList.find_or_create_by(spree_user_id: spree_user.id, variant_id: spree_variant.id)
  end

  def self.in_stock
    Spree::SimpleWaitList.pending.in_stock
  end
  def self.in_stock_for(user)
    Spree::SimpleWaitList.for_user(user).pending.in_stock
  end
end
