class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:id])

    respond_with merchant
  end
end
