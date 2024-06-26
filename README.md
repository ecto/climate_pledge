![The Climate Pledge](https://www.theclimatepledge.com/content/dam/amazonclimatepledge/logos/new-logo-color.svg)

The Climate Pledge is a commitment to be net-zero carbon by 2040 — a decade ahead of the Paris Agreement’s goal of 2050.

This Ruby Gem fetches the latest climate pledge signatories from the [Climate Pledge website](https://www.theclimatepledge.com/).

This Gem is not affiliated with The Climate Pledge or Amazon.

[![Gem Version](https://badge.fury.io/rb/climate_pledge.svg)](https://badge.fury.io/rb/climate_pledge)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'climate_pledge'
```

## Usage

Require the Gem:

```ruby
require 'climate_pledge'
```

## Fetching the latest signatories

You can fetch the latest signatories using the `signatories` method. For example:

```ruby
ClimatePledge.signatories

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
# ...
```

## Contributing

If you wish to run the tests, you can do so by running:

```bash
rake test
```

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
