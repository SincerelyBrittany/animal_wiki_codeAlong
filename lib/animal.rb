require 'Nokogiri'
require 'open-uri'

class Animal
  attr_accessor :name, :kingdom, :phylum, :klass, :order, :family, :genus, :species
  @@all = []

  #Hooks
  def initialize
    @@all << self
  end

  #self.all - Class Method, class getter
  def self.all
    @@all
  end

  #constructor
  def self.new_from_wikipedia(url) # this method is called a wrapper
    animal = Animal.new
    #we filled in the animals data
    doc = Nokogiri::HTML(open(url))
    animal.name = doc.search("h1#firstHeading").text
    # animal.kingdom = doc.search(".infoxbox.biota tbody tr[7] td[2]").text.strip      #	Animalia
    # animal.phylum = doc.search(".infoxbox.biota tbody tr[7] td[2]").text.strip      #	Chordata
    # animal.klass = doc.search(".infoxboc.biota tbody tr[7] td[2]").text.strip      #	Mammalia
    # animal.order = doc.search(".infoxboc.biota tbody tr[7] td[2]").text.strip      #	Artiodactyla
    # animal.family = doc.search(".infoxboc.biota tbody tr[7] td[2]").text.strip      #	Hippopotamidae
    # animal.genus = doc.search(".infoxboc.biota tbody tr[7] td[2]").text.strip      #	Hippopotamus
    # animal.species = doc.search(".infoxboc.biota tbody tr[7] td[2]").text.strip      #	H. amphibius

    #animal[:kingdom] = doc.search(".infobox.biota tbody tr[7] td[2]").text.strip

    animal
  end

  def self.new_from_search(keyword)
  end

end
