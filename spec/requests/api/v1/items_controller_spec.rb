# # GET /api/v1/invoices/:id/transactions returns a collection of associated transactions
# #     GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items
# #     GET /api/v1/invoices/:id/items returns a collection of associated items
# #     GET /api/v1/invoices/:id/customer returns the associated customer
# #     GET /api/v1/invoices/:id/merchant returns the associated merchant
#
# require 'spec_helper'
#
# describe "items controller" do #, :type => :request
#
#   it 'returns a collection of associated transactions' do
#     # items = FactoryGirl.create(:item)
#     require "pry"; binding.pry
#
#     get "/api/v1/invoices/:id/transactions"
#
#     # json = JSON.parse(response.body) -- added this method to spec helper
#
#     # test for the 200 status-code
#     expect(response).to be_success
#
#     # check to make sure the right amount of messages are returned
#     expect(json['items'].count).to eq(2)
#   end
#   #
#   # it 'retrieves a specific message' do
#   #   message = FactoryGirl.create(:message)
#   #   get "/api/v1/messages/#{message.id}"
#   #
#   #   # test for the 200 status-code
#   #   expect(response).to be_success
#   #
#   #   # check that the message attributes are the same.
#   #   expect(json['content']).to eq(message.content)
#   #
#   #   # ensure that private attributes aren't serialized
#   #   expect(json['private_attr']).to eq(nil)
#   # end
# end
