class Api::V1::Customers::InvoicesController < ApplicationController
  respond_to :json

  def show
    customer = Customer.find_by(customer_params)
    respond_with customer.invoices
  end

  private
    def customer_params
      params.permit(:id)
    end
end