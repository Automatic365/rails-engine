class Api::V1::Merchants::PendingsController < ApplicationController
  respond_to :json

  def index
    @merchant = Merchant.find(params[:id])
    respond_with @merchant
  end
end
