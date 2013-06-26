require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

#Hell World
get '/' do
  "Hello World"
end
