require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?

enable :sessions

get '/get_value' do
  "value = " << session[:value].inspect
end

get '/set/:value' do
  session[:value] = params[:value]
end

helpers do
  def reverse_and_upcase(str)
    str.reverse.upcase
  end
end


#Hello World
get '/' do
  reverse_and_upcase("Hello World")
end

get '/' do
  "Hello General Assembly"
end

get '/hello/:name/:age/:gender' do |n, a, g|
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  # n stores params[:name]
  "Hello #{n} #{a} #{g}!"
end

get '/say/*/to/*' do
  params[:splat]
end

get '/download/*.*' do
  # matches /download/path/to/file.xml
  @path = params[:splat][0] # => ["path/to/file", "xml"]
  @file_type = params[:splat][1]
  "I want to download #{@path}, which is a #{@file_type}"
end

#Returns true/false if its a valid phone number of not
# Valid format is 555-555-5555
get '/is_valid_phone/*' do
end


# Wrapping question marks around a parameter name makes it optional
get '/comments.?:format?' do
  # matches "GET /posts" and any extension "GET /posts.json", "GET /posts.xml" etc.

# Checks if the value of params[:format] is nil
  if params[:format].nil?
    return "No format"
  else
    return params[:format]
  end
end

# Big or small
get '/blog_post/?:size?' do
  if params[:size] == "big"
    "this is my blog".upcase
  else
    "this is my blog"
  end
end

get '/ugly' do
  "<!doctype html>
  <html>
  <head><title>NO</title></head><body>
  <h1>Wow, this is goign to be a lot of work to make a web site this way</h1>
  <p>Why would I do this to myself?</p>
  <p>I like this like \"this\"</p></body></html>"
end

get '/time' do
  code = "<h1><%= Time.now %></h1><p>Nope</p>"
  erb code
end
