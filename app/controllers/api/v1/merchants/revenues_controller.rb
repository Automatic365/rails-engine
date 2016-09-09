class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      # merchant = Merchant.find(params[:id])
      # require "pry"; binding.pry
      @date_revenue = Merchant.revenue_by_day(params[:id], params[:date])
      # date_revenue = merchant.revenue_by_day(params[:id], params[:date])
      # require "pry"; binding.pry
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
