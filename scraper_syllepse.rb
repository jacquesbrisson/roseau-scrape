require "rubygems"
require "nokogiri"
require "open-uri" ##si le fichier est sur Internet
require "csv"
require "pp"## A enlever

##resultat = Array.new
##precedent = Array.new

## Va chercher fichier CSV sur disque (sert de référence)
##data_file = './sil_reference.csv'
##CSV.foreach(data_file, headers: true) do |row|
##  precedent << row.to_hash
##end
##pp precedent

## Va chercher data sur site cible et construit Array
page = Nokogiri::HTML(open("https://www.syllepse.net/lng_FR_srub_22-nouveautes.html"))

pp page.css('html.js.flexbox.canvas.canvastext.webgl.no-touch.geolocation.postmessage.no-websqldatabase.indexeddb.hashchange.history.draganddrop.websockets.rgba.hsla.multiplebgs.backgroundsize.borderimage.borderradius.boxshadow.textshadow.opacity.cssanimations.csscolumns.cssgradients.no-cssreflections.csstransforms.csstransforms3d.csstransitions.fontface.generatedcontent.video.audio.localstorage.sessionstorage.webworkers.applicationcache.svg.inlinesvg.smil.svgclippaths body._debug div#mm-0.mm-page.mm-slideout div#page section div.clk-row div.clk-row.pager div.col-m-1-2 p').text

page.css('html.js.flexbox.canvas.canvastext.webgl.no-touch.geolocation.postmessage.no-websqldatabase.indexeddb.hashchange.history.draganddrop.websockets.rgba.hsla.multiplebgs.backgroundsize.borderimage.borderradius.boxshadow.textshadow.opacity.cssanimations.csscolumns.cssgradients.no-cssreflections.csstransforms.csstransforms3d.csstransitions.fontface.generatedcontent.video.audio.localstorage.sessionstorage.webworkers.applicationcache.svg.inlinesvg.smil.svgclippaths body._debug div#mm-0.mm-page.mm-slideout div#page section div.clk-row').each do |el|
  ##resultat << el.at_css('div.BlocListeLivreAuteur.LienBlocListeLivre').text
  ##resultat << el.at_css('div.BlocListeLivreTitre.LienBlocListeLivre').text
  pp el.at_css('html.js.flexbox.canvas.canvastext.webgl.no-touch.geolocation.postmessage.no-websqldatabase.indexeddb.hashchange.history.draganddrop.websockets.rgba.hsla.multiplebgs.backgroundsize.borderimage.borderradius.boxshadow.textshadow.opacity.cssanimations.csscolumns.cssgradients.no-cssreflections.csstransforms.csstransforms3d.csstransitions.fontface.generatedcontent.video.audio.localstorage.sessionstorage.webworkers.applicationcache.svg.inlinesvg.smil.svgclippaths body._debug div#mm-0.mm-page.mm-slideout div#page section div.clk-row div.col-s-1-2.col-m-1-3.col-l-1-4.col-mb2.col-mt article.produit-liste h2').text
  pp el.at_css('html.js.flexbox.canvas.canvastext.webgl.no-touch.geolocation.postmessage.no-websqldatabase.indexeddb.hashchange.history.draganddrop.websockets.rgba.hsla.multiplebgs.backgroundsize.borderimage.borderradius.boxshadow.textshadow.opacity.cssanimations.csscolumns.cssgradients.no-cssreflections.csstransforms.csstransforms3d.csstransitions.fontface.generatedcontent.video.audio.localstorage.sessionstorage.webworkers.applicationcache.svg.inlinesvg.smil.svgclippaths body._debug div#mm-0.mm-page.mm-slideout div#page section div.clk-row div.col-s-1-2.col-m-1-3.col-l-1-4.col-mb2.col-mt article.produit-liste h32').text
end
##pp resultat

##if (precedent - resultat).empty?
## pp "PAS DE CHANGEMENT"
##end

##PEUT-ETRE EN STRING OU EN ARRAY ET ENSUITE ON Parse EN JSON

## Compare les deux VAR et conclut


