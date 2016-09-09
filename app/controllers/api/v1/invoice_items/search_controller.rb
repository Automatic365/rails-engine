class Api::V1::InvoiceItems::SearchController < ApplicationController
  respond_to :json
  
  def index
    if params[:unit_price]
      price = params[:unit_price] 
      new_price = price.to_f * 100
      new_price = new_price.round(1).to_i
      # require "pry"; binding.pry
      @invoice_items = InvoiceItem.where(unit_price: new_price)
      respond_with @invoice_items
    else
      @invoice_items = InvoiceItem.where(invoice_item_params) 
      respond_with @invoice_items
    end
  end
  
  def show
    if params[:unit_price]
      price = params[:unit_price] 
      new_price = price.to_f * 100
      new_price = new_price.round(1).to_i
      @invoice_item = InvoiceItem.find_by(unit_price: new_price)
      respond_with @invoice_item
    else
      @invoice_item = InvoiceItem.find_by(invoice_item_params) 
      respond_with @invoice_item
    end
  end
  
  private
    def invoice_item_params
      params.permit(:id, :item_id, :quantity, :invoice_id, :unit_price, :created_at, :updated_at)
    end
end