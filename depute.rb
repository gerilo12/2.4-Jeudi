require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Recupere le nom des deputes
def get_the_of_all_the_deputees
  page_deputes = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  page_deputes.css("#deputes-list div ul li a").each do |e|
	puts e.text
end
end

get_the_of_all_the_deputees
