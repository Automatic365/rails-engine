class Api::V1::Invoices::TransactionsController < ApplicationController
  respond_to :json

  def show
    @transactions = Invoice.find_by(invoice_params).transactions
    respond_with @transactions
  end

  private
    def invoice_params
      params.permit(:id)
    end
end
