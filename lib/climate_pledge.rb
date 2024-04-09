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
