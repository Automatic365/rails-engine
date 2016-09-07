class Customer < ApplicationRecord
  has_many :invoices

  def self.random
    limit(1).order("RANDOM()")
  end

end
