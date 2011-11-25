require 'rubygems'
require 'sinatra'
require 'haml'
require 'base64'
 
# show the upload form
get "/upload" do
  haml :filedrag
end      
 
# receive and save the uploaded file
post "/upload" do
  puts params.inspect

  File.open('public/uploads/' + params['file']['name'], "wb") do |f|
    f.write(Base64.decode64(params['file']['data']))
  end

  return "uploads/#{params['file']['name']}"
end
