json.extract! invoice_item, :id, :quantity, :invoice_id, :item_id, :created_at, :updated_at

json.invoice_item do |json|
  json.unit_price item.formatted_unit_price
end
