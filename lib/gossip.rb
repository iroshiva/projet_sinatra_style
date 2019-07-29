# require 'csv'

# require 'pry'

class Gossip
# reprend certaines méthodes d'instance utilisées vendredi dernier

	attr_accessor :author, :content
	# variables d'instance

	def initialize(author, content)
		@author = author
		@content = content 
	end
	# initialisation des deux variables d'instances pour chaque instance créée

	def save
	# méthode d'instance chargée de sauvegarder en .csv le prenom et le potin de l'utilisateur

	 CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
   end
		
	end

	def self.all
	# méthode de class chargée de sortir un array de tous les potins

	  all_gossips = []
	  CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips

	end

	def self.find(id)
	# méthode de class chargée de chercher un potin dans l'array de tous les potins

		Gossip.all[id.to_s.to_i]
		# .to_s.to_i == sert à transformer l'id(symbol) en Integer
	end

end


# binding.pry
# puts "end of file"