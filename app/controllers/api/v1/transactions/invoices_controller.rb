class Api::V1::Transactions::InvoicesController < ApplicationController
  respond_to :json
  
  def show
    transaction = Transaction.find_by(transaction_params)
    invoice = Invoice.find(transaction.invoice_id)
    respond_with invoice
  end
  
  private
    def transaction_params
      params.permit(:id)
    end
end