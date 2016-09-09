require 'rails_helper'
include Requests

describe 'Customers find controller' do
  it 'sends a list of customers by params' do
    create(:customer, first_name: 'Tommasina')
    create(:customer, first_name: 'Tommasina')
    create(:customer, first_name: 'Jason')

    get '/api/v1/customers/find_all', { first_name: 'Tommasina' }

    expect(response).to be_success

    expect(json.second["first_name"]).to eq('Tommasina')
    expect(json.count).to eq(2)
  end

  it 'sends a customer by params' do
    create(:customer, first_name: 'Tommasina')
    create(:customer, first_name: 'Jason')
    create(:customer, first_name: 'Jason')

    get '/api/v1/customers/find', { first_name: 'Jason' }

    expect(response).to be_success

    expect(json["first_name"]).to eq('Jason')
    expect(json["first_name"]).not_to eq('Tommasina')
    expect(json.count).to eq(5)
  end
end
