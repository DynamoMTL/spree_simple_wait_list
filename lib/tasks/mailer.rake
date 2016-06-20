namespace :spree_simple_wait_list do
  desc "sends an email to subscribed users for products back in stock"
  task notify: :environment do
    Spree::SimpleWaitList.in_stock.each do |row|
      SimpleWaitList::UserMailer.notify(email: row.email, variant: row.variant)
      row.notified = true
      row.save
    end
  end
end