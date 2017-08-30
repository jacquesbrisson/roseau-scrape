require "rubygems"
require "nokogiri"
require "open-uri" ##si le fichier est sur Internet
require "json"
require "pp"## A enlever

## Va chercher fichier JSON sur disque (sert de référence)
ref = File.read('reference.json')
precedent = JSON.parse(ref)
pp precedent

## Va chercher data sur site cible et construit var JSON
page = Nokogiri::HTML(open("http://www.lafabrique.fr/catalogue.php?mode=new"))

page.css('html body div#global div#Centrale div.BlocListeLivre').each do |el|
  puts '{ "Auteur:"' + el.at_css('div.BlocListeLivreAuteur.LienBlocListeLivre').text + '", '
  puts '"Titre:"' + el.at_css('div.BlocListeLivreTitre.LienBlocListeLivre').text + '" },'
end
PEUT-ETRE EN STRING OU EN ARRAY ET ENSUITE ON Parse EN JSON

## Compare les deux VAR et conclut


