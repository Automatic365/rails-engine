class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      @merchant = Merchant.revenue_by_day(params[:id], params[:date])
      respond_with @merchant
    else
      @merchant = Merchant.find(params[:id])
      respond_with @merchant
    end
  end
end
