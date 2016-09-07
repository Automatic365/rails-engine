class Api::V1::Invoices::CustomersController < ApplicationController
  respond_to :json
  
  def show
    invoice = Invoice.find_by(invoice_params)
    customer = Customer.find(invoice.customer_id)
    respond_with customer
  end
  
  private
    def invoice_params
      params.permit(:id)
    end
end