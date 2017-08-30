require "rubygems"
require "nokogiri"
require "open-uri" ##si le fichier est sur Internet
require "csv"
require "pp"## A enlever

resultat = Array.new
precedent = Array.new

## Va chercher fichier CSV sur disque (sert de référence)
data_file = './reference.csv'
CSV.foreach(data_file, headers: true) do |row|
  precedent << row.to_hash
end
##pp precedent

## Va chercher data sur site cible et construit Array
page = Nokogiri::HTML(open("http://www.lafabrique.fr/catalogue.php?mode=new"))

page.css('html body div#global div#Centrale div.BlocListeLivre').each do |el|
  resultat << el.at_css('div.BlocListeLivreAuteur.LienBlocListeLivre').text
  resultat << el.at_css('div.BlocListeLivreTitre.LienBlocListeLivre').text
  ##pp el.at_css('div.BlocListeLivreAuteur.LienBlocListeLivre').text
  ##pp el.at_css('div.BlocListeLivreTitre.LienBlocListeLivre').text
end
##pp resultat

if (precedent - resultat).empty?
  pp "PAS DE CHANGEMENT"
end

##PEUT-ETRE EN STRING OU EN ARRAY ET ENSUITE ON Parse EN JSON

## Compare les deux VAR et conclut


