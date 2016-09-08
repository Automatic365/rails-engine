class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices

  def total_revenue(id)
    Merchant.select("invoices.merchant_id, sum (invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoice_items)
    .where('invoices.merchant_id = ?', id)
    .group("invoices.merchant_id")
  end

  def self.revenue_by_day(id, date)
    Merchant.joins(invoices: [:transactions, :invoice_items])
    .where(id: id).where(transactions: { result: 'success' })
    .where(invoices: { created_at: date})
    .sum('invoice_items.quantity * invoice_items.unit_price')
  end

  def pending_invoices
    customer_ids = invoices.joins(:transactions)
    .where("transactions.result = 'failed'").pluck("invoices.customer_id").uniq
    Customer.find(customer_ids)
  end

  def self.most_items(quantity)
    Merchant.joins(invoices: :invoice_items).group(:id)
    .order('sum(invoice_items.quantity) DESC').limit(quantity)
  end


end
