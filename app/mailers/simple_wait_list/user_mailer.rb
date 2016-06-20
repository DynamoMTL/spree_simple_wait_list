module SimpleWaitList
  class UserMailer < Spree::BaseMailer

    def notify(email:, variant:)
      @email = email
      @variant = variant
      mail to: email, from: from_address
    end
  end
end