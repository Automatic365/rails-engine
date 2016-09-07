require 'spec_helper'

RSpec.describe "MerchantItemsController" do
  describe "get merchant items" do

    it 'returns a collection of items associated with that merchant' do
      merchant = build(:merchant)
      get "/api/v1/merchants/#{name.id}/items"

      expect(response).to be_success

      expect(merchant.items.count).to eq(2)
    end
  end
end
