# frozen_string_literal: true

require_relative 'config/application'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry-byebug' # para interromper a execução do código e debugar: binding.pry

# http://localhost:4567
get '/' do
  @restaurants = Restaurant.all
  erb :index
end

# http://localhost:4567/restaurants/<número do id>
get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

# Envio do formulário
post '/restaurants' do
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  # após salvar, mostrar a lista de restaurantes de novo
  redirect '/'
end
