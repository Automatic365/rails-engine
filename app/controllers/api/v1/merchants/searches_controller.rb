class Api::V1::Merchants::SearchesController < ApplicationController
  respond_to :json

  def show
    merchant = Merchant.find_by(request.query_parameters)

    respond_with merchant
  end

  def index
    merchant = Merchant.where(request.query_parameters)

    respond_with merchant
  end

end
