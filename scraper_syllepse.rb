require "rubygems"
require "nokogiri"
require "open-uri" ##si le fichier est sur Internet
require "csv"

resultat = Array.new
precedent = Array.new

## Va chercher fichier CSV sur disque (sert de référence)
data_file = './sil_reference.csv'
CSV.foreach(data_file, headers: true) do |row|
  precedent << row.to_hash
end

## Va chercher data sur site cible et construit Array
page = Nokogiri::HTML(open("https://www.syllepse.net/lng_FR_srub_22-nouveautes.html"))
page.css('div.col-mt').each do |el|
  resultat << el.at_css('h2').text
  resultat << el.at_css('h3').text
end

if (precedent - resultat).empty?
 pp "PAS DE CHANGEMENT"
end




