# require 'bundler'
# Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
#Dans cette partie, nous avons créé une classe ApplicationController qui hérite (<) de la classe Sinatra::Base. Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base (= toutes les fonctionnalités de base de Sinatra).

  get '/' do
  # get == plutôt affichage pur

  	erb :index, locals: {gossips: Gossip.all}
  	# "si quelqu'un va sur '/', affiche la view index.erb"
  	# locals: == permet d'envoyer à notre fichier ERB des variables que l'on utilisera.
  	# ici, veut dire gossips = Gossip.all

	end
	# Cela dit à l'appli Sinatra "si quelqu'un va sur l'URL '/', exécute le code qui suit !"

	get '/gossips/new/' do
	   erb :new_gossip
	end
	# affichage la view de new_gossip.erb

	post '/gossips/new/' do
	# post == plutôt une action à faire

   Gossip.new(params["gossip_author"], params["gossip_content"]).save

   redirect '/'
	end

	get '/gossips/:id' do
		erb :show, locals: {gossip: Gossip.find(params[:id]), id: params[:id]}
	end

	get '/gossips/:id/edit' do
		erb :edit, locals: {id: params[:id]}
	end

	post '/gossips/:id/edit' do
   Gossip.new(params["gossip_author"], params["gossip_content"]).save

   redirect '/'
	end

end

