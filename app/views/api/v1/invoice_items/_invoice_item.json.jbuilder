json.extract! invoice_item, :created_at, :id, :invoice_id, :item_id, :quantity, :unit_price, :updated_at

json.invoice_item do |json|
  json.unit_price invoice_item.formatted_unit_price
end
