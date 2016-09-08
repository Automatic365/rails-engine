require 'spec_helper'

RSpec.describe MerchantItemsController do
  describe "get merchant items" do

    it 'returns a collection of items associated with that merchant' do
      merchant = create(:merchant)
      #create items here with sequence using a method that would generate :item_name
      item = create(:item, merchant: merchant)
      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_success

      expect(merchant.items.count).to eq(2)
      
      #could have another merchant to test they don't see each other's items 
    end
  end
end
  #
  # it 'retrieves a specific message' do
  #   message = FactoryGirl.create(:message)
  #   get "/api/v1/messages/#{message.id}"
  #
  #   # test for the 200 status-code
  #   expect(response).to be_success
  #
  #   # check that the message attributes are the same.
  #   expect(json['content']).to eq(message.content)
  #
  #   # ensure that private attributes aren't serialized
  #   expect(json['private_attr']).to eq(nil)
  # end
