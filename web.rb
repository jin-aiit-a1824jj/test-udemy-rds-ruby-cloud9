require 'sinatra'
require 'sinatra/reloader'

register Sinatra::Reloader

get '/' do
    'Hello!'
end