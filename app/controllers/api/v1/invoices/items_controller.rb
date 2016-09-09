class Api::V1::Invoices::ItemsController < ApplicationController
  respond_to :json
  
  def show
    invoice = Invoice.find_by(invoice_params)
    respond_with invoice.items
  end
  
  private
    def invoice_params
      params.permit(:id)
    end
end