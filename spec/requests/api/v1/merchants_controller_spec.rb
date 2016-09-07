require 'spec_helper'

describe "merchants controller", :type => :request do
  # fixtures :merchants
  # GET /api/v1/merchants/:id/items returns a collection of items associated with that merchant
  it 'returns a collection of items associated with that merchant' do
    # require "pry"; binding.pry
    
    name = merchants(:one)
    get "/api/v1/merchants/#{name.id}/items"

    # json = JSON.parse(response.body) -- added this method to spec helper

    # test for the 200 status-code
    expect(response).to be_success

    # check to make sure the right amount of messages are returned
    expect(json['items'].count).to eq(2)
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
end
