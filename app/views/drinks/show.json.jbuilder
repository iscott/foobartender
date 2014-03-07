json.drink do |json|
  json.extract! @drink, :id, :drink_name, :drink_price, :alcohol, :mixer, :finish, :over_ice, :top_shelf, :is_fancy
 end