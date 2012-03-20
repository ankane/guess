# Guess

*Statistically* determine a person's gender based on his / her name.

```ruby
Guess.gender("Don Draper")
# => {:gender => "male", :confidence => 0.9965635738831615}
Guess.gender("Betty Draper")
# => {:gender => "female", :confidence => 0.9992498124531133}
Guess.gender("Mad Men")
# => {:gender => "unknown", :confidence => nil}
```

Statistical data obtained from the [US Census Bureau](http://www.census.gov/genealogy/names/names_files.html), so it works best with American names.

## Installation

Add this line to your application's Gemfile:

    gem "guess"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guess

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
