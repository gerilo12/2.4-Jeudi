require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url_mairie)
  page = Nokogiri::HTML(open(url_mairie))
  page.css('td')[7].text
end

#get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")
def get_all_the_urls_of_val_doise_townhalls()
    page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    page.css('a.lientxt').map{|x| x['href'].delete_prefix(".")}.map{|path| "http://annuaire-des-mairies.com" + path}
end


def bonus()

  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  page.css(".lientxt").each do |lien|
  url = "http://annuaire-des-mairies.com" + lien['href'][1..-1].to_s
  nom_ville=lien.text
  email=get_the_email_of_a_townhal_from_its_webpage(url)

  h={:name => nom_ville, :mail => email}
  puts h

  end

end

bonus






#  page = Nokogiri::HTML(open(url_departement))

#    page.css(".lientxt").each do |link|
#    url_mairie= link['href'].delete_prefix(".")}.map{|path| "http://annuaire-des-mairies.com" + path}

#    city=link.text
#    puts adress_email=get_the_email_of_a_townhal_from_its_webpage(url_mairie)

    #hash={city =>adress_email}

    #puts hash

#  end

#end

#get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/val-d-oise.html')
