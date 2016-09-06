class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices

  def total_revenue(id)
    # merchant = Merchant.includes(:invoices)
    #   merchant_revenue = []
    #   merchant = Merchant.find(id)
    #
    #   merchant.invoices.each do |invoice|
    #    invoice.invoice_items.each do |item|
    #      merchant_revenue << (item.unit_price * item.quantity)
    #    end
    #   end
    #   merchant_revenue.reduce(:+)
    # end

    # select invoices.merchant_id, sum( invoice_items.quantity * invoice_items.unit_price)
    # AS sum FROM invoice_items INNER JOIN invoices on invoices.id = invoice_items.invoice_id
    # WHERE invoices.merchant_id = 1 GROUP BY invoices.merchant_id;

    Merchant.select("invoices.merchant_id, sum (invoice_items.quantity * invoice_items.unit_price) as revenue")
    .joins(:invoice_items)
    .where('invoices.merchant_id = ?', id)
    .group("invoices.merchant_id")
  end

end
