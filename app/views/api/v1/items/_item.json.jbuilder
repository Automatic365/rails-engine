json.extract! item, :id, :name, :description, :created_at, :updated_at, :merchant_id

json.item do |json|
  json.unit_price item.formatted_unit_price
end