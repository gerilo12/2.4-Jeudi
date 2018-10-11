require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_the_money()
  all_cryptocurrencies = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

  hsh = Hash.new

  all_cryptocurrencies.css("tr").each do |crypto|
      hsh[crypto.css("a.currency-name-container.link-secondary").text] = crypto.css("a.price").text
  end

  return hsh

end

#petite méthode sympathique pour faire un truc toutes les n secondes...
def every_n_seconds(n)
      loop do
        before = Time.now
        yield #yield allows you to “inject” that code at some place into a function
        interval = n-(Time.now-before)
        sleep(interval) if interval > 0
      end
end

# se met en place de la façon suivante :
every_n_seconds(3600) do
    puts get_all_the_money
end
