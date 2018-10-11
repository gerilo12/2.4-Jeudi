require 'rubygems'
require 'nokogiri'
require 'open-uri' #on peut aussi utiliser require 'restclient'

#page = Nokogiri::HTML(open("http://bettermotherfuckingwebsite.com/"))
#puts page
#puts page.css("title")[0].name
#puts page.css("title")[0].text

#links = page.css("a")
#puts links.length   # => 6
#puts links[0].text   # => Click here
#puts links[0]["href"] # => http://www.google.com

#news_links = page.css("a").select{|link| link[0] == "this site's inspiration"}
#news_links.each{|link| puts link['href'] }

############Xpaths################
page = Nokogiri::HTML(open("http://bettermotherfuckingwebsite.com/"))
doc.xpath('//h3/a').each do |node| #Find all "a" tags with a parent tag whose name is "h3"
	  puts node.text
	end

//h3[@class = "r"]/a[@class = "l"] #Find all "a" tags with a class attribute equal to "l" and an immediate parent tag "h3"
