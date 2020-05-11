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

  def self.find_by_name(name)
    self.all.detect{|a| a.name == name}
  end

  #constructor - allows you to create an object based off different environments
  def self.new_from_wikipedia(url) # this method is called a wrapper
    animal = Animal.new
    #we filled in the animals data
    # doc = Nokogiri::HTML(open(url))
    # animal.name = doc.search("h1#firstHeading").text
    # animal.kingdom = doc.search(".infobox.biota tbody tr[7] td[2]").text.strip      #	Animalia
    # animal.phylum = doc.search(".infobox.biota tbody tr[8] td[2]").text.strip      #	Chordata
    # animal.klass = doc.search(".infobox.biota tbody tr[9] td[2]").text.strip      #	Mammalia
    # animal.order = doc.search(".infobox.biota tbody tr[10] td[2]").text.strip      #	Artiodactyla
    # animal.family = doc.search(".infobox.biota tbody tr[11] td[2]").text.strip      #	Hippopotamidae
    # animal.genus = doc.search(".infobox.biota tbody tr[12] td[2]").text.strip      #	Hippopotamus
    # # animal.species = doc.search(".infobox.biota tbody tr[13] td[2]").text.strip      #	H. amphibius
    # #animal[:kingdom] = doc.search(".infobox.biota tbody tr[7] td[2]").text.strip

    properties = AnimalScrapper.wikipedia(url)
    properties.each do |k,v|
      animal.send("#{k}=",v) #mass assignments
      #send method is equalvalent to
      #fido.send('name=', "Rover")
      #fido.name=("rover") #using the 'name=' method

    end
    animal
  end

  def self.new_from_search(keyword)
  end

  def self.new_from_database(row)
    Animal.new.tap do |animal|
      #Tap - allows you to get the object and whatever as tapped is returned
      #do something
    end
  end



end
