require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:home)
end

get("/square/results") do
  @num = params.fetch("number").to_f

  @result = @num * @num
  @result = @result.to_f

  @cat = "Square"

  @next_cmd_str = "Calculate another square"
  @next_cmd = "/square/new"

  erb(:flexible)
end

get("/square/new") do
  erb(:home)
end

get("/square_root/new") do
  erb (:sqrt)
end

get ("/square_root/results") do
  @num = params.fetch("number").to_f

  @result = Math.sqrt(@num)
  @result = @result.to_f

  @cat = "Square Root"

  @next_cmd_str = "Calculate another square root"
  @next_cmd = "/square_root/new"

  erb(:flexible)
end

get("/payment/new") do
  erb(:pay)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f
  @apr_formatted = @apr.to_fs(:percentage, {:precision => 4})
  @apr = @apr / 1200

  @years = params.fetch("yrs").to_i
  @months = @years * 12

  @principal = params.fetch("principal").to_f
  @principal_formatted = @principal.to_fs(:currency)

  @payment = @apr * @principal
  @payment = @payment / (1 - ((1 + @apr) ** (-@months)))
  @payment = @payment.to_fs(:currency)

  erb (:pay_results)
end

get("/random/new") do
  erb (:ran)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f

  @random = rand(@min..@max)

  erb (:ran_results)
end
