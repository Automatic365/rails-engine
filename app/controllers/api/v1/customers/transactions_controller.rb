class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def show
    @transactions = Customer.find_by(customer_params).transactions
    respond_with @transactions
  end

  private
    def customer_params
      params.permit(:id)
    end
end
