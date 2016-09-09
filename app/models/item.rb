class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  
  def best_day_revenue
    invoice_items.joins(invoice: [:transactions])
    .where("transactions.result = 'success'")
    .order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC")
    .group("invoices.created_at")
    .limit(1)
    .sum("invoice_items.quantity * invoice_items.unit_price")
    .keys.first
  end
  
  def formatted_unit_price
    # require "pry"; binding.pry
    formatted = unit_price/100.00
    formatted.to_s
  end
end
