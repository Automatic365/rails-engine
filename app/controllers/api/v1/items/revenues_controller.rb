class Api::V1::Items::RevenuesController < ApplicationController
  respond_to :json

  def index
    @best_day = Item.find(params[:id]).best_day_revenue

    respond_with @best_day
  end

  def show
    item = Item.most_revenue(params[:quantity])

    respond_with item
  end

end
