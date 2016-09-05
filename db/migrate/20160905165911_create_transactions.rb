class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.date :credit_card_expiration_date
      t.string :result
      t.integer :credit_card_number
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
