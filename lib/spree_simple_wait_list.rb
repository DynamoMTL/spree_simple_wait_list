require 'spree_core'
require 'spree_simple_wait_list/engine'

module SimpleWaitList
  def self.add(user_email:, spree_variant:)
    Spree::SimpleWaitList.find_or_create_by(email: user_email, variant_id: spree_variant.id).valid?
  end

  def self.in_stock
    Spree::SimpleWaitList.pending.in_stock
  end
  def self.in_stock_for(email)
    Spree::SimpleWaitList.for_user(email).pending.in_stock
  end
end
