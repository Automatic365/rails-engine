class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.all

    respond_with merchant
  end

  def show
    merchant = Merchant.find(params[:id])

    respond_with merchant
  end
end
