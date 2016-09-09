class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    @merchant = Merchant.find(params[:id])

     respond_with @merchant#{"revenue" => "@merchant.total_revenue" }
  end

end
