class Api::V1::Items::ItemInvoiceItemsController < ApplicationController
  respond_to :json

  def index
    item = Item.find(params[:id])

    respond_with item.invoice_items
  end


end
