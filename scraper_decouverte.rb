require "rubygems"
require "nokogiri"
require "open-uri" ##si le fichier est sur Internet
require "csv"
require "pp"

resultat = Array.new
precedent = Array.new

## Va chercher fichier CSV sur disque (sert de référence)
##data_file = './decouv_reference.csv'
##CSV.foreach(data_file) do |row| ## Pas la bonne methode!
##  precedent = row
##end

## Va chercher data sur site cible et construit Array
page = Nokogiri::HTML(open("http://www.editionsladecouverte.fr/nouveaute/news.php"))
## On compte le nombre de pages
page.css('html body div.site div.container div.padding_20_0.border_top div.bg_blanc.padding_20.shadow.margin_20_0 div.tri_pagination.bg_grisF2.padding_10.size13.hidden-xs div.row div.col-md-8 nav.text-center ul.pagination').each do |el|
  pp "J en trouve: " + el.length
end

page.css('html body div.site div.container div.padding_20_0.border_top div.bg_blanc.padding_20.shadow.margin_20_0 div.liste_pdt div.row div.col-sm-6.col-md-4.text-center').each do |el|
  ##resultat << el.at_css('p strong.size14').text
  pp el.at_css('p strong.size14').text
  ##resultat << el.at_css('p span.size12.gris72 strong').text
  pp el.at_css('p span.size12.gris72 strong').text
end

##pp "Precedent: " + precedent.length.to_s + " rangees"
##pp "Resultat: " + resultat.length.to_s + " rangees"
##if (precedent - resultat).empty? ## Compare les deux arrays et conclut
##  pp "PAS DE CHANGEMENT"
##end
