module Spree
  class SimpleWaitList < ActiveRecord::Base
    has_many :spree_users, dependent: :destroy
    has_many :spree_variants, dependent: :destroy

    scope :pending, -> { where(notified: false) }

    def self.for_user(user)
      joins(:spree_users).where(spree_users: { id: user.id } )
    end

    def in_stock
      joins(:spree_variants).where(spree_variants: { stock_items_count: 1 } )
    end
  end
end