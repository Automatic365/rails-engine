FactoryGirl.define do
  factory :transaction do
    credit_card_expiration_date "2016-09-05"
    result "MyString"
    credit_card_number 1
    invoice nil
  end
end
