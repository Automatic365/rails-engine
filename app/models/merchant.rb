class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  
  def total_revenue(id)
    # merchant = Merchant.includes(:invoices)    
    merchant_revenue = [] 
    merchant = Merchant.find(id)
    # require "pry"; binding.pry
    merchant.invoices.each do |invoice|
     invoice.items.each do |item|
       merchant_revenue << item.unit_price
     end
    end    
    merchant_revenue.reduce(:+)
  end
end
