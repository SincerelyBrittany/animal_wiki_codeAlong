class AnimalScrapper
  def self.wikipedia(url)
    #We fill in the animals data
    doc = Nokogiri::HTML(open(url))

    animal = {}
    animal[:name] = doc.search("h1#firstHeading").text
    animal[:kingdom] = doc.search(".infobox.biota tbody tr[7] td[2]").text.strip      #	Animalia
    animal[:phylum] = doc.search(".infobox.biota tbody tr[8] td[2]").text.strip      #	Chordata
    animal[:klass] = doc.search(".infobox.biota tbody tr[9] td[2]").text.strip      #	Mammalia
    animal[:order] = doc.search(".infobox.biota tbody tr[10] td[2]").text.strip      #	Artiodactyla
    animal[:family] = doc.search(".infobox.biota tbody tr[11] td[2]").text.strip      #	Hippopotamidae
    animal[:genus] = doc.search(".infobox.biota tbody tr[12] td[2]").text.strip      #	Hippopotamus
    # animal.species = doc.search(".infobox.biota tbody tr[13] td[2]").text.strip      #	H. amphibius
    #animal[:kingdom] = doc.search(".infobox.biota tbody tr[7] td[2]").text.strip
   animal

  end
end
