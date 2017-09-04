require "rubygems"
require "nokogiri"
require "open-uri" ##si le fichier est sur Internet
require "csv"
require "pp"

resultat = Array.new
precedent = Array.new

## Va chercher fichier CSV sur disque (sert de référence)
data_file = './sil_reference.csv'
CSV.foreach(data_file) do |row| ## Pas la bonne methode!
  precedent = row
end

## Va chercher data sur site cible et construit Array
page = Nokogiri::HTML(open("https://www.syllepse.net/lng_FR_srub_22-nouveautes.html"))
page.css('div.col-mt').each do |el|
  resultat << el.at_css('h2').text
  resultat << el.at_css('h3').text
end

pp "Precedent: " + precedent.length.to_s + " rangees"
pp "Resultat: " + resultat.length.to_s + " rangees"
if (precedent - resultat).empty?
  pp "PAS DE CHANGEMENT"
end




