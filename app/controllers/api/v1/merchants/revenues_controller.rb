class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      @date_revenue = Merchant.revenue_by_day(params[:id], params[:date])
      respond_with @date_revenue
    else
      @merchant = Merchant.find(params[:id])
      respond_with @merchant
    end
  end
  
  private
    def revenue_params
      params.permit(:id, :date)
    end
end
