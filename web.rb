require 'sinatra'
require 'sinatra/reloader'

register Sinatra::Reloader

get '/' do
    
    @number = rand(10)
    
    erb :index
end