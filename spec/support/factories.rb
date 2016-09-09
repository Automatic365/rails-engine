# require 'faker'

FactoryGirl.define do
  factory :merchant do
    name "Merchant Isabella"
  end

  factory :item do
    name "Beluga Whale"
    description "giant of the sea"
    unit_price 1000.00
    merchant

    factory :item_with_invoice_items do
      transient do
        invoice_items_count 5
      end
    end

      factory :item_with_invoices do
        transient do
          invoices_count 5
        end
      end
    end


  factory :customer do
    first_name "Mickey"
    last_name "Mouse"
  end

  factory :invoice_item do
    quantity 250
    unit_price 125.00
    item
    invoice
  end

  factory :invoice do
    status "shipped"
    customer
    merchant
  end

  factory :transaction do
    credit_card_expiration_date "2016-09-07"
    result "successful"
    credit_card_number "1234-4567-7890-1234"
    transaction
  end

  # sequence :username do |n|
  #   "myString#{n}@example.com"
  # end
end
