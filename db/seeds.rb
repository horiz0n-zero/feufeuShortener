# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

urls = ["https://www.42firenze.it", "http://42berlin.de/", "http://www.42kocaeli.com.tr", "http://www.42istanbul.com.tr", "https://42mulhouse.fr", "https://42lausanne.ch/", "https://42alicante.com/", "http://42wolfsburg.de/", "https://42abudhabi.ae/", "http://42network.org/", "http://www.42nice.fr/", "https://42urduliz.com/", "https://42heilbronn.de/", "http://www.42lisboa.com", "http://www.42malaga.com", "http://www.42adel.org.au", "http://www.42amman.com", "https://www.42bangkok.com/", "https://42yerevan.am/", "https://www.42roma.it", "https://www.42seoul.kr", "https://42.rio", "https://www.42.us.org/", "https://42tokyo.jp", "http://www.42madrid.com/", "https://1337.ma", "https://42sp.org.br", "http://www.coderdojosv.org/", "https://itouchup.org/iwork/", "https://1337.ma", "https://www.wethinkcode.co.za/", "http://www.codam.nl", "https://www.hive.fi/", "https://www.s19.be", "https://www.google.fr", "http://academyplus.ro", "https://www.42lyon.fr/", "https://unit.ua/", "https://www.42.us.org/", "http://academyplus.md/", "https://www.wethinkcode.co.za/", "https://www.academyplus.ro/", "http://www.42.fr/"]

for url in urls do
  element = Element.new(url: url, slug: Element.next_slug)
  element.save
end
