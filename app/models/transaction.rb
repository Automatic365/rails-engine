class Transaction < ApplicationRecord
  belongs_to :invoice

  def self.random
    limit(1).order("RANDOM()")
  end

end
