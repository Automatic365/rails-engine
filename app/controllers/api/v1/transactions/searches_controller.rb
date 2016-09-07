class Api::V1::Transactions::SearchesController < ApplicationController
  respond_to :json

  def index
    transactions = Transaction.where(transaction_params)

    respond_with transactions
  end

  def show
    transaction = Transaction.find_by(transaction_params)

    respond_with transaction
  end

  private

  def transaction_params
    params.permit(:id, :credit_card_expiration_date, :result,
    :credit_card_number, :invoice_id, :created_at, :updated_at)
  end

end
