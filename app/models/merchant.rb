class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def total_revenue
    # require "pry"; binding.pry
    (invoices.successful.map(&:total_amount).reduce(:+)/100.00).to_s
  end

  def self.revenue_by_day(id, date)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: 'success'})
    .where(id: id)
    .where(invoices: { created_at: date})
    .sum('(invoice_items.quantity * invoice_items.unit_price)/100.00')

    # SELECT sum(invoice_items.quantity * invoice_items.unit_price) AS sum FROM invoices INNER JOIN merchants ON invoices.merchant_id = merchants.id INNER JOIN transactions ON transactions.invoice_id = invoices.id INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id WHERE transactions.result = 'success' AND merchants.id = 30 AND invoices.created_at = '2012-03-16 11:55:05' GROUP BY merchants.id;
  end

  def self.most_revenue(quantity)
    select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS most_revenue")
    .joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group("merchants.id")
    .order("most_revenue DESC")
    .take(quantity)
  end

  def pending_invoices
    customer_ids = invoices.joins(:transactions)
    .where("transactions.result = 'failed'").pluck("invoices.customer_id").uniq
    Customer.find(customer_ids)
  end

  def self.most_items(quantity)
    joins(invoices: [:transactions, :invoice_items])
  .where(transactions: { result: 'success' })
  .group(:id)
  .order('SUM(invoice_items.quantity) DESC')
  .limit(quantity)
  end

  def self.all_revenue(date)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: 'success'})
    .where(invoices: { created_at: date})
    .sum('(invoice_items.quantity * invoice_items.unit_price/100.00)')
  end

  def favorite_customer
    customer_id = customers.joins(:transactions)
    .where(transactions: {result: "success"})
    .group('customers.id').order("count_transactions DESC").limit(1)
    .count("transactions")
    .keys.join
  Customer.find(customer_id)
  end
end
