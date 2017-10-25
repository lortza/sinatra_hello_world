require 'sinatra'
require "sinatra/reloader" if development?
require 'erb'

require './helpers/string_helper'

get '/' do
  time = Time.now
  name = params[:name]
  city = params[:city]
  "<h1>Hello World!</h1>
  <h2>The params name is #{name} of #{city}</h2>
  <p>it is #{time}</p>"
end

get '/reverser' do
  erb :reverser_form
end

post '/reversed_result' do
  result = reverser_method(params[:word_input])
  erb :reversed_result, locals: { reversed: result }
end

get '/tacos' do
  @daily_special = 'carne asada'
  salsas = %w(picante roja verde lizano)
  erb :tacos, locals: { sauces: salsas }
end

get '/special' do
  erb :special_view, layout: :special_layout
end

get '/nested_page' do
  erb :'nesty/nested_view', layout: :'nesty/nested_layout'
end





