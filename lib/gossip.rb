require 'csv'

class Gossip

  attr_accessor :author, :content

  def initialize(author, content)#les 2 attributs d'un potin
  	@author = author
  	@content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content] #ajouté à la BDD
    end
  end

  def self.all #récupérer les potins et les mettre dans un tableau
    all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
    return all_gossips
  end

  def self.find(id) #afficher chaque potin par id
    self.all.each_with_index do |gossip|
      (gossip == id)? new_gossip = gossip : nil
    end
    return gossip
  end

end