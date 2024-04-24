require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square)
end

get("/square/new") do
  erb(:new_square)
end

get("/square/results") do

  @input = params.fetch("number").to_f
  @squared = @input ** 2 

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root)
end


get("/square_root/results") do

  @input = params.fetch("number").to_f
  @square_rooted = @input ** (1/2.0)

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @apr_raw = params.fetch("user_apr").to_f 
  @apr_rate = @apr_raw / 100
  @mpr = @apr_rate/12
  @apr = @apr_raw.to_fs(:percentage, {:precision => 4})
  @years = params.fetch("user_years").to_f
  @principal_raw = params.fetch("user_pv").to_f
  @principal = @principal_raw.to_fs(:currency)

  @payment_raw = (@principal_raw * @mpr) / ( 1-(1+@mpr) ** -(12*@years))
  @payment = @payment_raw.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random_numb = rand(@min..@max)

  erb(:random_results)
end
