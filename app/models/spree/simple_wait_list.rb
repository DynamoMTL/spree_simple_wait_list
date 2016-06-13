module Spree
  class SimpleWaitList < ActiveRecord::Base
    belongs_to :user, class_name: 'Spree::User', dependent: :destroy
    belongs_to :variant, class_name: 'Spree::Variant', dependent: :destroy

    scope :pending, -> { where(notified: false) }

    def self.for_user(user)
      joins(:user).where(user: { id: user.id } )
    end

    def self.in_stock
      joins(:variant).pending.merge(Spree::Variant.in_stock)
    end
  end
end