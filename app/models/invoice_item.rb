class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  
  def total_amount
    quantity * unit_price
  end
  
  def formatted_unit_price
    formatted = unit_price/100.00
    formatted.to_s
  end
  
  def unit_price
    (self[:unit_price]).round(2).to_s
  end
end
