class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    customer = Customer.find(params[:id]).favorite_merchant
    respond_with customer
  end


end
