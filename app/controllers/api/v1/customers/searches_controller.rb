class Api::V1::Customers::SearchesController < ApplicationController
  respond_to :json

  def index
    customer = Customer.where(customer_params)

    respond_with customer
  end

  def show
    customer = Customer.find_by(customer_params)

    respond_with customer
  end

  private

  def  customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end


end
