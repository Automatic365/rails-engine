class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices

  def total_revenue(id)
    Merchant.select("invoices.merchant_id, sum (invoice_items.quantity * invoice_items.unit_price) as revenue")
    .joins(:invoice_items)
    .where('invoices.merchant_id = ?', id)
    .group("invoices.merchant_id")
  end

end
