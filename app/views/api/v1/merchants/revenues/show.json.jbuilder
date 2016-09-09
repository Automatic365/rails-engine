  if params[:date]
    json.revenue @date_revenue
  else
    json.revenue @merchant.total_revenue
  end

