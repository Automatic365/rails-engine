# GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
class Api::V1::Merchants::CustomersController < ApplicationController
  respond_to :json

  def index
    @merchant = Merchant.find(params[:id])
    respond_with @merchant
  end
end
