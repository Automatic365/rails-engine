class Api::V1::InvoiceItems::SearchController < ApplicationController
  respond_to :json
  
  def index
    invoice_items = InvoiceItem.where(request.query_parameters)
    respond_with invoice_items
  end
  
  def show
    invoice_item = InvoiceItem.find_by(request.query_parameters)
    respond_with invoice_item
  end
  
  private
    def invoice_item_params
      params.require(:invoice_item).permit(:id, :name, :created_at, :updated_at)
    end
end