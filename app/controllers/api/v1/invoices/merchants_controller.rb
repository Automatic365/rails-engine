class Api::V1::Invoices::MerchantsController < ApplicationController
  respond_to :json
  
  def show
    invoice = Invoice.find_by(invoice_params)
    merchant = Merchant.find(invoice.customer_id)
    respond_with merchant
  end
  
  private
    def invoice_params
      params.permit(:id)
    end
end