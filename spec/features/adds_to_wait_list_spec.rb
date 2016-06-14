require 'spec_helper'

RSpec.describe 'Adding a user to the list' do

  let(:user) { create(:user, email: 'user@example.com') }
  let(:product) { create(:variant, sku: 'SKU-1234') }
  let(:other_product) { create(:variant, sku: 'SKU-5678') }
  it 'adds an entry to the list' do
    SimpleWaitList::add(user_email: user.email, spree_variant: product)
    expect(Spree::SimpleWaitList.all.count).to eql(1)
  end

  it 'does not add a duplicate email and sku combo' do
    SimpleWaitList::add(user_email: user.email, spree_variant: product)
    SimpleWaitList::add(user_email: user.email, spree_variant: product)
    expect(Spree::SimpleWaitList.all.count).to eql(1)
  end

  it 'adds an entry for an existing email and a new sku' do
    SimpleWaitList::add(user_email: user.email, spree_variant: product)
    SimpleWaitList::add(user_email: user.email, spree_variant: other_product)
    expect(Spree::SimpleWaitList.all.count).to eql(2)
  end
end