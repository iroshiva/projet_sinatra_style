# require 'bundler'
# Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
#Dans cette partie, nous avons créé une classe ApplicationController qui hérite (<) de la classe Sinatra::Base. Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base (= toutes les fonctionnalités de base de Sinatra).

  get '/' do
  # get == plutôt affichage pur

  	erb :index, locals: {gossips: Gossip.all}
  	# "si quelqu'un va sur '/', affiche la view index.erb"
  	# locals: == permet d'envoyer à notre fichier erb corecpondant des variables que l'on utilisera.
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
    # method qui prend l'attribut des names dans le view new_gossip.erb
    # crée une instance initialisée par deux variables author("gossip_authur") et content("gossip_content") détaillée dans gossip.rb

    redirect '/'
    # après la création du potin, redirection vers la page d'accueil

	end

	get '/gossips/:id' do
		erb :show, locals: {gossip: Gossip.find(params[:id]), id: params[:id]}
		# deux variables sont injectées dans show.erb: gossip = method self.find de la class Gossip et id = variable de la methode self.find

	end

	get '/gossips/:id/edit' do
		erb :edit, locals: {id: params[:id]}
		# variable id injectée dans edit.erb
	end

	post '/gossips/:id/edit' do
   Gossip.new(params["gossip_author"], params["gossip_content"]).save

   redirect '/'
	end
	# idem que pour le post '/gossips/new/' do

end

