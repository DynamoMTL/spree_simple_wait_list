require 'spec_helper'

RSpec.describe 'Retrieving a users wait list' do

  let(:user) { create(:user, email: 'user@example.com') }
  let(:product_in_stock) { create(:variant, sku: 'SKU-1234') }
  let(:product_out_of_stock) { create(:variant, sku: 'SKU-5678') }
  let(:product_in_stock_and_notified) { create(:variant, sku: 'SKU-ABCD') }

  it 'returns products in stock only', :focus do
    product_in_stock.stock_items.first.adjust_count_on_hand 10
    product_in_stock.save
    SimpleWaitList::add(spree_user: user, spree_variant: product_in_stock)
    SimpleWaitList::add(spree_user: user, spree_variant: product_out_of_stock)

    list = Spree::SimpleWaitList.in_stock

    expect(list.count).to eq(1)
    expect(list.first.variant_id).to eq(2)

  end

  it 'returns products for which the user has not been notified already' do
    skip "not implemented"
  end
end