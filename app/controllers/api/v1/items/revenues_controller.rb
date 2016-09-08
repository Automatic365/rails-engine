class Api::V1::Items::RevenuesController < ApplicationController
  respond_to :json

  def index
    item = Item.find(params[:id])

    respond_with item.best_day_revenue
  end
end
