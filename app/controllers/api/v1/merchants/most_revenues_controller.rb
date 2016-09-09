class Api::V1::Merchants::MostRevenuesController < ApplicationController
  respond_to :json

  def index
    @most_revenue = Merchant.most_revenue(params[:group_number])

    respond_with @most_revenue
  end

  private
    def revenue_params
      params.permit(:id, :group_number)
    end
end
