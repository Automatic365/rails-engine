class Api::V1::InvoiceItems::InvoiceItemsInvoiceController < ApplicationController
  respond_to :json

  def index
    invoice_item = InvoiceItem.find(params[:id])

    respond_with invoice_item.invoice
  end

end
