class Api::V1::Invoices::MerchantsController < ApplicationController
  respond_to :json

  def show
    @merchant = Invoice.find_by(invoice_params).merchant
    respond_with @merchant
  end

  private
    def invoice_params
      params.permit(:id)
    end
end
