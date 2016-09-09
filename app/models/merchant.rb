class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def total_revenue
    invoices.successful.map(&:total_amount).reduce(:+)/100.00
    # select("invoices.merchant_id, sum (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    # .joins(:invoice_items)
    # .where('invoices.merchant_id = ?', id)
    # .group("invoices.merchant_id")
  end

end
