require "open-uri"
require "json"
require "date"

class ClimatePledge
  BASE = "https://www.theclimatepledge.com"
  SIGNATORY_LIST = "#{BASE}/content/amazonclimatepledge/us/en/Signatories/jcr:content/root/responsivegrid/c19_grid.signatoryList.json"

  def self.signatories
    json = JSON.load(URI.open(SIGNATORY_LIST))
    json["signatories"]&.map(&method(:format_signatory))
  end

  def self.format_signatory(signatory)
    {
      name: signatory["name"],
      logo: "#{BASE}#{signatory["logoSrc"]}",
      link: "#{BASE}#{signatory["link"]}",
      slug: signatory["link"]&.split("/")&.last&.split(".")&.first,
      country: signatory["country"],
      industry: signatory["industryTag"],
      join_date: Date.parse(signatory["joinDate"])
    }
  end
end

# [{:name=>"Boom Supersonic",
#   :logo=>"https://www.theclimatepledge.com/content/dam/amazonclimatepledge/signatory-logo/Boom - Desktop.png",
#   :link=>"https://www.theclimatepledge.com/content/amazonclimatepledge/us/en/Signatories/boom-supersonic.html",
#   :slug=>"boom-supersonic",
#   :country=>"United States of America",
#   :industry=>"Manufacturing",
#   :join_date=>#<Date: 2020-11-29 ((2459183j,0s,0n),+0s,2299161j)>},
#  {:name=>"Verizon",
#   :logo=>"https://www.theclimatepledge.com/content/dam/amazonclimatepledge/signatory-logo/Verizon - Desktop.png",
#   :link=>"https://www.theclimatepledge.com/content/amazonclimatepledge/us/en/Signatories/verizon.html",
#   :slug=>"verizon",
#   :country=>"United States of America",
#   :industry=>"Services",
#   :join_date=>#<Date: 2020-06-14 ((2459015j,0s,0n),+0s,2299161j)>},
#  {:name=>"Cabify",
#   :logo=>"https://www.theclimatepledge.com/content/dam/amazonclimatepledge/signatory-logo/2022/Cabify.png",
#   :link=>"https://www.theclimatepledge.com/content/amazonclimatepledge/us/en/Signatories/cabify.html",
#   :slug=>"cabify",
#   :country=>"Spain",
#   :industry=>"Transportation services",
#   :join_date=>#<Date: 2020-11-29 ((2459183j,0s,0n),+0s,2299161j)>},
#  {:name=>"Henkel",
#   :logo=>"https://www.theclimatepledge.com/content/dam/amazonclimatepledge/signatory-logo/Henkel - Desktop.png",
#   :link=>"https://www.theclimatepledge.com/content/amazonclimatepledge/us/en/Signatories/henkel.html",
#   :slug=>"henkel",
#   :country=>"Germany",
#   :industry=>"Materials",
#   :join_date=>#<Date: 2020-11-15 ((2459169j,0s,0n),+0s,2299161j)>},
