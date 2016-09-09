class Api::V1::Items::RevenuesController < ApplicationController
  respond_to :json

  def index
    item = Item.find(params[:id])

    respond_with item.best_day_revenue
  end

  def show
    item = Item.most_revenue(params[:quantity])

    respond_with item
  end

end
