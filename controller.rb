require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry'

# require_relative './models/customer'
require_relative './models/film'
# require_relative './models/screening'
# require_relative './models/ticket'
also_reload('./models/*')

# 4. In the **controller.rb**, use the `Film.all()` method to get all the film objects and pass them to the view.

get '/films' do
  @film_array = Film.all()
  erb(:index)
end


get '/films/:name' do
  @selected_film = Film.find(params[:name])
  @title = @selected_film.title
  @price = @selected_film.price
  # @title = params['title']
  # @price = params['price'].to_i
  erb(:film_detail)
end
