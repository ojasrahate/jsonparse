require 'json'

file_data = File.read("food.json")
json_hash = JSON.parse(file_data)
veg_mum = veg_del = nonveg_mum = nonveg_del = 0       #initializing max values to zero

json_hash.each do |batch|
    batch['cost'] = batch['cost'].to_i                #json has cost as string converting to int
  if batch["preference"] == "Vegetarian"
    if batch["city"] == "Mumbai"
      veg_mum = batch["cost"] if batch["cost"] > veg_mum
    elsif batch["city"] == "Delhi"
      veg_del = batch['cost'] if batch['cost'] > veg_del
    end
  elsif batch["preference"] == "Non-Vegetarian"
    if batch["city"] == "Mumbai"
      nonveg_mum = batch['cost'] if batch['cost'] > nonveg_mu
    elsif batch["city"] == "Delhi"
      nonveg_del = batch['cost'] if batch['cost'] > nonveg_del
    end
  end
end

puts "Costliest Veg Mumbai:#{veg_mum}"
  puts "*********************************************"
puts "Costliest Non-Veg Mumbai:#{nonveg_mum}"
  puts "*********************************************"
puts "Costliest Veg Delhi:#{veg_del}"
  puts "*********************************************"
puts "Costliest Non-Veg Delhi:#{nonveg_del}"
