class Api::V1::Merchants::SearchesController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.where(merchant_params)

    respond_with merchant
  end

  def show
    merchant = Merchant.find_by(merchant_params)

    respond_with merchant
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
