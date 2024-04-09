require "open-uri"
require "json"
require "date"

# A client for Climate Pledge data.
# More information about the Climate Pledge can be found at:
# https://www.theclimatepledge.com/
class ClimatePledge
  BASE = "https://www.theclimatepledge.com"
  SIGNATORY_LIST = "#{BASE}/content/amazonclimatepledge/us/en/Signatories/jcr:content/root/responsivegrid/c19_grid.signatoryList.json"

  # Returns a list of signatories to the Climate Pledge,
  # first formatting the data for each signatory.
  def self.signatories
    json = JSON.load(URI.open(SIGNATORY_LIST))
    json["signatories"]&.map(&method(:format_signatory))
  end

  # Formats a signatory for display.
  # The expected signatory input format is a hash with the following keys:
  # - name
  # - logoSrc
  # - link
  # - country
  # - industryTag
  # - joinDate
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
