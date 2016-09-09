json.array! @invoice_items, :id, :item_id, :invoice_id, :created_at, :updated_at, :quantity, :unit_price

# json.invoice_items do |json|
#   json.unit_price @invoice_items.formatted_unit_price.to_s
# end