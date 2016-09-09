class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
    
    scope :successful, -> {joins(:transactions).where("transactions.result = 'success'")}
  
  def total_amount
    invoice_items.map(&:total_amount).reduce(:+)
  end
end
