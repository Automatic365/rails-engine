require 'csv'

desc "Import customers from csv file"
task :import => [:environment] do

    file = "db/csv/customers.csv"

    CSV.foreach(file, headers: true) do |row|
      Customer.create(
        first_name: row[1],
        last_name: row[2],
        created_at: row[3],
        updated_at: row[4]
      )
    end
end

desc "Import merchants from csv file"
task :import => [:environment] do

    file = "db/csv/merchants.csv"

    CSV.foreach(file, headers: true) do |row|
      Merchant.create(
        name: row[1],
        created_at: row[2],
        updated_at: row[3]
      )
    end
end

desc "Import items from csv file"
task :import => [:environment] do

    file = "db/csv/items.csv"

    CSV.foreach(file, headers: true) do |row|
      Item.create(
        name: row[1],
        description: row[2],
        unit_price: row[3],
        merchant_id: row[4],
        created_at: row[5],
        updated_at: row[6]
      )
    end
end

desc "Import invoices from csv file"
task :import => [:environment] do

    file = "db/csv/invoices.csv"

    CSV.foreach(file, headers: true) do |row|
      Invoice.create!(
        customer_id: row[1],
        merchant_id: row[2],
        status: row[3],
        created_at: row[4],
        updated_at: row[5]
      )
    end
end

desc "Import transactions from csv file"
task :import => [:environment] do

    file = "db/csv/transactions.csv"

    CSV.foreach(file, headers: true) do |row|
      Transaction.create!(
        invoice_id: row[1],
        credit_card_number: row[2],
        credit_card_expiration_date: row[3],
        result: row[4],
        created_at: row[5],
        updated_at: row[6]
      )
    end
end

desc "Import invoice_items from csv file"
task :import => [:environment] do

    file = "db/csv/invoice_items.csv"

    CSV.foreach(file, headers: true) do |row|
      InvoiceItem.create(
        quantity: row[1],
        unit_price: row[2],
        invoice_id: row[3],
        item_id: row[4],
        created_at: row[5],
        updated_at: row[6]
      )
    end
end
