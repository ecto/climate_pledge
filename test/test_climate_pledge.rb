require "minitest/autorun"
require "climate_pledge"

class ClimatePledgeTest < Minitest::Test
  # Test that all signatories are returned,
  # and not just a subset/page. We test that the
  # count of signatories is greater than 477 so
  # the tests will pass as the number of signatories grows.
  def test_index_count
    assert_operator 477, :>=, ClimatePledge.signatories.count
  end

  # Test that an expected signatory is returned.
  # This will only break if the signatory is removed
  # from the Climate Pledge website, or if the data
  # format changes.
  def test_index
    expected = {
      :name=>"Sellen Construction",
      :logo=>"https://www.theclimatepledge.com/content/dam/amazonclimatepledge/signatory-logo/2024/Sellen.png",
      :link=>"https://www.theclimatepledge.com/content/amazonclimatepledge/us/en/Signatories/sellen-construction.html",
      :slug=>"sellen-construction",
      :country=>"United States of America",
      :industry=>"Infrastructure",
      :join_date=>Date.parse("04-03-2024")
    }

    assert ClimatePledge.signatories.include?(expected)
  end

  # Test that the format_signatory method returns
  # the expected output. This is what the downstream user
  # will see when they call ClimatePledge.signatories, so
  # it should break if the format changes.
  def test_format_signatory
    raw_signatory = {
      "name"=>"Sellen Construction",
      "link"=>"/content/amazonclimatepledge/us/en/Signatories/sellen-construction.html",
      "logoSrc"=>"/content/dam/amazonclimatepledge/signatory-logo/2024/Sellen.png",
      "logoAlt"=>"Sellen Construction logo",
      "country"=>"United States of America",
      "newCopy"=>"New",
      "industryTag"=>"Infrastructure",
      "joinDate"=>"Mar 4, 2024",
      "isNew"=>false
    }
    expected_signatory = {
      :name=>"Sellen Construction",
      :logo=>"https://www.theclimatepledge.com/content/dam/amazonclimatepledge/signatory-logo/2024/Sellen.png",
      :link=>"https://www.theclimatepledge.com/content/amazonclimatepledge/us/en/Signatories/sellen-construction.html",
      :slug=>"sellen-construction",
      :country=>"United States of America",
      :industry=>"Infrastructure",
      :join_date=>Date.parse("04-03-2024")
    }

    assert_equal expected_signatory.to_json,
      ClimatePledge.format_signatory(raw_signatory).to_json
  end
end
