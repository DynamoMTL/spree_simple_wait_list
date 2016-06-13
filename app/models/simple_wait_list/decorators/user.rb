module SimpleWaitList
  module Decorators
    class User
      def self.prepended(base)
        has_many :simple_wait_lists, class_name: 'Spree::SimpleWaitList'
        class << base
          def not_pushed
            where(pushed: false)
          end
        end
      end
    end
  end
end