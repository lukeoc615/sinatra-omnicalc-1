require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("user's_number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("user's_number").to_f

  @the_result = @the_num ** 0.5
  
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_calc)
end

get("/payment/results") do
  @the_num = params.fetch("user's_number").to_f
  @the_num_2 = params.fetch("user's_number_2").to_f
  @the_num_3 = params.fetch("user's_number_3").to_f
  r = @the_num/100/12
  n = @the_num_2.to_i * 12
  pv = @the_num_3
  
  @numerator = r * pv
  @denominator = 1 - ((1 + r) ** -n)
  @the_result = @numerator/@denominator
  
  erb(:payment_results)
end
