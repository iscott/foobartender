json.drinks do |json|      
  json.array!(@drinks) do |drink| 
    json.extract! drink, :id, :drink_name, :drink_price, :is_fancy
    json.url drink_url(drink, format: :json)   
  end
end
