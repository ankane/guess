# Guess

*Statistically* determine a person’s gender based on his or her name.

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

Add this line to your application’s Gemfile:

```ruby
gem 'guess'
```

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ankane/guess/issues)
- Fix bugs and [submit pull requests](https://github.com/ankane/guess/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
