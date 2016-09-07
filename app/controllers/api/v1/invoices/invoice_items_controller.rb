class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  respond_to :json
  
  def show
    invoice = Invoice.find_by(invoice_items_params)
    respond_with invoice.invoice_items
  end
  
  private
    def invoice_items_params
      params.permit(:id)
    end
end