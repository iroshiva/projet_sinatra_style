# require 'bundler'
# Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
	   erb :new_gossip
	end

	post '/gossips/new/' do
   Gossip.new(params["gossip_author"], params["gossip_content"]).save

   redirect '/'
	end

	get '/hello/:id' do
	  matches "GET /hello/foo" and "GET /hello/bar"
	  params['id'] is 'foo' or 'bar'
	  "Voici le numéro du potin que tu veux: #{params['id']}!"
	end

  # run! if app_file == $0
end

