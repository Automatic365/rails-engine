class Api::V1::Invoices::CustomersController < ApplicationController
  respond_to :json

  def show
    customer = Invoice.find_by(invoice_params).customer
    respond_with customer
  end

  private
    def invoice_params
      params.permit(:id)
    end
end
