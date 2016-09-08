class Api::V1::InvoiceItems::InvoiceItemsItemController < ApplicationController
  respond_to :json

  def index
    invoice_item = InvoiceItem.find(params[:id])

    respond_with invoice_item.item
  end

end
