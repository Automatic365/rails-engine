class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find(params[:id])

    respond_with merchant.total_revenue(merchant.id)
  end
end
